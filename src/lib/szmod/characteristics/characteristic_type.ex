defmodule Szmod.Characteristics.CharacteristicType do
  use Ecto.Schema
  import Ecto.Changeset

  schema "characteristic_types" do
    field :name, :string
    field :uuid, :integer

    timestamps()
  end

  @doc false
  def changeset(characteristic_type, attrs) do
    characteristic_type
    |> cast(attrs, [:name, :uuid])
    |> validate_required([:name, :uuid])
    |> unique_constraint(:uuid)
  end
end
