defmodule Szmod.Repo.Migrations.CreateSensors do
  use Ecto.Migration

  def change do
    create table(:sensors) do
      add :name, :string
      add :address, :string
      add :sensor_type_id, references(:sensor_types, on_delete: :nothing), null: false
      add :device_id, references(:devices, on_delete: :nothing), null: false

      timestamps()
    end

    create index(:sensors, [:sensor_type_id])
    create index(:sensors, [:device_id])
  end
end
