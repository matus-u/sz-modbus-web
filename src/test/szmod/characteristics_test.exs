defmodule Szmod.CharacteristicsTest do
  use Szmod.DataCase

  alias Szmod.Characteristics

  describe "characteristic_types" do
    alias Szmod.Characteristics.CharacteristicType

    @valid_attrs %{name: "some name", uuid: 42}
    @update_attrs %{name: "some updated name", uuid: 43}
    @invalid_attrs %{name: nil, uuid: nil}

    def characteristic_type_fixture(attrs \\ %{}) do
      {:ok, characteristic_type} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Characteristics.create_characteristic_type()

      characteristic_type
    end

    test "list_characteristic_types/0 returns all characteristic_types" do
      characteristic_type = characteristic_type_fixture()
      assert Characteristics.list_characteristic_types() == [characteristic_type]
    end

    test "get_characteristic_type!/1 returns the characteristic_type with given id" do
      characteristic_type = characteristic_type_fixture()
      assert Characteristics.get_characteristic_type!(characteristic_type.id) == characteristic_type
    end

    test "create_characteristic_type/1 with valid data creates a characteristic_type" do
      assert {:ok, %CharacteristicType{} = characteristic_type} = Characteristics.create_characteristic_type(@valid_attrs)
      assert characteristic_type.name == "some name"
      assert characteristic_type.uuid == 42
    end

    test "create_characteristic_type/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Characteristics.create_characteristic_type(@invalid_attrs)
    end

    test "update_characteristic_type/2 with valid data updates the characteristic_type" do
      characteristic_type = characteristic_type_fixture()
      assert {:ok, %CharacteristicType{} = characteristic_type} = Characteristics.update_characteristic_type(characteristic_type, @update_attrs)
      assert characteristic_type.name == "some updated name"
      assert characteristic_type.uuid == 43
    end

    test "update_characteristic_type/2 with invalid data returns error changeset" do
      characteristic_type = characteristic_type_fixture()
      assert {:error, %Ecto.Changeset{}} = Characteristics.update_characteristic_type(characteristic_type, @invalid_attrs)
      assert characteristic_type == Characteristics.get_characteristic_type!(characteristic_type.id)
    end

    test "delete_characteristic_type/1 deletes the characteristic_type" do
      characteristic_type = characteristic_type_fixture()
      assert {:ok, %CharacteristicType{}} = Characteristics.delete_characteristic_type(characteristic_type)
      assert_raise Ecto.NoResultsError, fn -> Characteristics.get_characteristic_type!(characteristic_type.id) end
    end

    test "change_characteristic_type/1 returns a characteristic_type changeset" do
      characteristic_type = characteristic_type_fixture()
      assert %Ecto.Changeset{} = Characteristics.change_characteristic_type(characteristic_type)
    end
  end
end
