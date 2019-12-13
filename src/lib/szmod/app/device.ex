defmodule Szmod.App.Device do
  use Ecto.Schema
  import Ecto.Changeset
  alias Szmod.Sensors.Sensor

  schema "devices" do
    field :name, :string
    field :uuid, :string
    has_many :sensors, Sensor

    timestamps()
  end

  @doc false
  def changeset(device, attrs) do
    device
    |> cast(attrs, [:name, :uuid])
    |> validate_required([:name, :uuid])
    |> unique_constraint(:uuid)
  end
end
