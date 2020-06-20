defmodule TestingEcto.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :email, :string

    field :avatar_letters, :string, virtual: true

    timestamps()
  end

  def changeset(struct_or_changeset, params) do
    struct_or_changeset
    |> cast(params, [:name, :email])
    |> validate_required([:name])
    |> validate_length(:name, min: 3)
    |> validate_format(:email, ~r/@/)
  end

  def avatar_letters(%__MODULE__{} = user) do
    avatar_letters =
      user.name
      |> String.split()
      |> Enum.map_join("", fn <<letter::binary-size(1), _rest::binary>> ->
        letter
      end)

    struct!(user, avatar_letters: avatar_letters)
  end
end
