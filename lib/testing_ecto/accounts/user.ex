defmodule TestingEcto.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :email, :string

    timestamps()
  end

  def changeset(struct_or_changeset, params) do
    struct_or_changeset
    |> cast(params, [:name, :email])
    |> validate_required([:name])
    |> validate_length(:name, min: 3)
    |> validate_format(:email, ~r/@/)
  end
end
