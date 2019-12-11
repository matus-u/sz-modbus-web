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

  describe "characteristics" do
    alias Szmod.Characteristics.Characteristic

    @valid_attrs %{unit: "some unit", value: 120.5}
    @update_attrs %{unit: "some updated unit", value: 456.7}
    @invalid_attrs %{unit: nil, value: nil}

    def characteristic_fixture(attrs \\ %{}) do
      {:ok, characteristic} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Characteristics.create_characteristic()

      characteristic
    end

    test "list_characteristics/0 returns all characteristics" do
      characteristic = characteristic_fixture()
      assert Characteristics.list_characteristics() == [characteristic]
    end

    test "get_characteristic!/1 returns the characteristic with given id" do
      characteristic = characteristic_fixture()
      assert Characteristics.get_characteristic!(characteristic.id) == characteristic
    end

    test "create_characteristic/1 with valid data creates a characteristic" do
      assert {:ok, %Characteristic{} = characteristic} = Characteristics.create_characteristic(@valid_attrs)
      assert characteristic.unit == "some unit"
      assert characteristic.value == 120.5
    end

    test "create_characteristic/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Characteristics.create_characteristic(@invalid_attrs)
    end

    test "update_characteristic/2 with valid data updates the characteristic" do
      characteristic = characteristic_fixture()
      assert {:ok, %Characteristic{} = characteristic} = Characteristics.update_characteristic(characteristic, @update_attrs)
      assert characteristic.unit == "some updated unit"
      assert characteristic.value == 456.7
    end

    test "update_characteristic/2 with invalid data returns error changeset" do
      characteristic = characteristic_fixture()
      assert {:error, %Ecto.Changeset{}} = Characteristics.update_characteristic(characteristic, @invalid_attrs)
      assert characteristic == Characteristics.get_characteristic!(characteristic.id)
    end

    test "delete_characteristic/1 deletes the characteristic" do
      characteristic = characteristic_fixture()
      assert {:ok, %Characteristic{}} = Characteristics.delete_characteristic(characteristic)
      assert_raise Ecto.NoResultsError, fn -> Characteristics.get_characteristic!(characteristic.id) end
    end

    test "change_characteristic/1 returns a characteristic changeset" do
      characteristic = characteristic_fixture()
      assert %Ecto.Changeset{} = Characteristics.change_characteristic(characteristic)
    end
  end
end
