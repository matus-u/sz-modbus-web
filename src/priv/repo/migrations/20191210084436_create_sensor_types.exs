defmodule Szmod.Repo.Migrations.CreateSensorTypes do
  use Ecto.Migration

  def change do
    create table(:sensor_types) do
      add :name, :string

    end

    create unique_index(:sensor_types, [:name])
  end
end
