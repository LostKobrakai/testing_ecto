defmodule TestingEcto.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children =
      [
        ecto_repos()
      ]
      |> List.flatten()

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TestingEcto.Supervisor]
    Supervisor.start_link(children, opts)
  end

  defp ecto_repos() do
    Application.get_env(:testing_ecto, :start_repos)
  end
end
