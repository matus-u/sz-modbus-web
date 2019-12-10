defmodule Szmod.Repo.Migrations.CreateCharacteristicTypes do
  use Ecto.Migration

  def change do
    create table(:characteristic_types) do
      add :name, :string, null: false
      add :uuid, :integer, null: false

      timestamps()
    end

    create unique_index(:characteristic_types, [:uuid])
  end
end
