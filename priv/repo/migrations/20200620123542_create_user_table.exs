defmodule TestingEcto.Repo.Migrations.CreateUserTable do
  use Ecto.Migration

  def change do
    create table("users") do
      add :name, :string, null: false
      add :email, :string, null: true

      timestamps()
    end
  end
end
