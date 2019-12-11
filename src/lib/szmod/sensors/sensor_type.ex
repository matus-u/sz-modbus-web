defmodule Szmod.Sensors.SensorType do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sensor_types" do
    field :name, :string

  end

  @doc false
  def changeset(sensor_type, attrs) do
    sensor_type
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> unique_constraint(:name)
  end
end
