defmodule Szmod.Repo.Migrations.CreateDevices do
  use Ecto.Migration

  def change do
    create table(:devices) do
      add :name, :string, null: false
      add :uuid, :string, null: false

      timestamps()
    end

    create unique_index(:devices, [:uuid])
  end
end
