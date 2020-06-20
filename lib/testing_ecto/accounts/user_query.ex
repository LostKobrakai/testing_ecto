defmodule TestingEcto.Accounts.UserQuery do
  defstruct filters: []

  def new(filters) do
    %__MODULE__{filters: filters}
  end
end
