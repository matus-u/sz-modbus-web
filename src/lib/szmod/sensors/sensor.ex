defmodule Szmod.Sensors.Sensor do
  use Ecto.Schema
  import Ecto.Changeset

  alias Szmod.Sensors.SensorType
  alias Szmod.App.Device
  alias Szmod.Characteristics.Characteristic

  schema "sensors" do
    field :address, :string
    field :name, :string
    field :enabled, :boolean
    belongs_to :sensor_type, SensorType
    belongs_to :device, Device
    has_many :characteristics, Characteristic

    timestamps()
  end

  @doc false
  def changeset(sensor, attrs) do
    sensor
    |> cast(attrs, [:name, :address, :enabled])
    |> validate_required([:name, :address, :device, :sensor_type])
  end
end
