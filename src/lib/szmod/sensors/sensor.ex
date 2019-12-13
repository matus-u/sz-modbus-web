defmodule Szmod.Sensors.Sensor do
  use Ecto.Schema
  import Ecto.Changeset

  alias Szmod.Sensors.SensorType
  alias Szmod.App.Device
  alias Szmod.Characteristics.Characteristic

  schema "sensors" do
    field :uuid, :string
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
    |> cast(attrs, [:uuid, :name, :address, :enabled])
    |> validate_required([:uuid, :name, :address])
    |> unique_constraint(:uuid)
  end
end
