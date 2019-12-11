defmodule Szmod.Repo.Migrations.CreateCharacteristics do
  use Ecto.Migration

  def change do
    create table(:characteristics) do
      add :value, :float
      add :unit, :string
      add :characteristic_type_id, references(:characteristic_types, on_delete: :nothing)
      add :sensor_id, references(:sensors, on_delete: :nothing)

      timestamps()
    end

    create index(:characteristics, [:characteristic_type_id])
    create index(:characteristics, [:sensor_id])
  end
end
