defmodule Szmod.Characteristics.Characteristic do
  use Ecto.Schema
  import Ecto.Changeset

  alias Szmod.Sensors.Sensor
  alias Szmod.Characteristics.CharacteristicType

  schema "characteristics" do
    field :unit, :string
    field :value, :float
    belongs_to :characteristic_type, CharacteristicType
    belongs_to :sensor, Sensor

    timestamps()
  end

  @doc false
  def changeset(characteristic, attrs) do
    characteristic
    |> cast(attrs, [:value, :unit])
    |> validate_required([:value, :unit])
  end
end
