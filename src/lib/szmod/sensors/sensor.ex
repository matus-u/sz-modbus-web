defmodule Szmod.Sensors.Sensor do
  use Ecto.Schema
  import Ecto.Changeset

  alias Szmod.Sensors.SensorType
  alias Szmod.App.Device

  schema "sensors" do
    field :address, :string
    field :name, :string
    belongs_to :sensor_type, SensorType
    belongs_to :device, Device

    timestamps()
  end

  @doc false
  def changeset(sensor, attrs) do
    sensor
    |> cast(attrs, [:name, :address])
    |> validate_required([:name, :address, :device, :sensor_type])
  end
end
