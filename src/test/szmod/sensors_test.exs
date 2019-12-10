defmodule Szmod.SensorsTest do
  use Szmod.DataCase

  alias Szmod.Sensors

  describe "sensor_types" do
    alias Szmod.Sensors.SensorType

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def sensor_type_fixture(attrs \\ %{}) do
      {:ok, sensor_type} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sensors.create_sensor_type()

      sensor_type
    end

    test "list_sensor_types/0 returns all sensor_types" do
      sensor_type = sensor_type_fixture()
      assert Sensors.list_sensor_types() == [sensor_type]
    end

    test "get_sensor_type!/1 returns the sensor_type with given id" do
      sensor_type = sensor_type_fixture()
      assert Sensors.get_sensor_type!(sensor_type.id) == sensor_type
    end

    test "create_sensor_type/1 with valid data creates a sensor_type" do
      assert {:ok, %SensorType{} = sensor_type} = Sensors.create_sensor_type(@valid_attrs)
      assert sensor_type.name == "some name"
    end

    test "create_sensor_type/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sensors.create_sensor_type(@invalid_attrs)
    end

    test "update_sensor_type/2 with valid data updates the sensor_type" do
      sensor_type = sensor_type_fixture()
      assert {:ok, %SensorType{} = sensor_type} = Sensors.update_sensor_type(sensor_type, @update_attrs)
      assert sensor_type.name == "some updated name"
    end

    test "update_sensor_type/2 with invalid data returns error changeset" do
      sensor_type = sensor_type_fixture()
      assert {:error, %Ecto.Changeset{}} = Sensors.update_sensor_type(sensor_type, @invalid_attrs)
      assert sensor_type == Sensors.get_sensor_type!(sensor_type.id)
    end

    test "delete_sensor_type/1 deletes the sensor_type" do
      sensor_type = sensor_type_fixture()
      assert {:ok, %SensorType{}} = Sensors.delete_sensor_type(sensor_type)
      assert_raise Ecto.NoResultsError, fn -> Sensors.get_sensor_type!(sensor_type.id) end
    end

    test "change_sensor_type/1 returns a sensor_type changeset" do
      sensor_type = sensor_type_fixture()
      assert %Ecto.Changeset{} = Sensors.change_sensor_type(sensor_type)
    end
  end

  describe "sensors" do
    alias Szmod.Sensors.Sensor

    @valid_attrs %{address: "some address", name: "some name"}
    @update_attrs %{address: "some updated address", name: "some updated name"}
    @invalid_attrs %{address: nil, name: nil}

    def sensor_fixture(attrs \\ %{}) do
      {:ok, sensor} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sensors.create_sensor()

      sensor
    end

    test "list_sensors/0 returns all sensors" do
      sensor = sensor_fixture()
      assert Sensors.list_sensors() == [sensor]
    end

    test "get_sensor!/1 returns the sensor with given id" do
      sensor = sensor_fixture()
      assert Sensors.get_sensor!(sensor.id) == sensor
    end

    test "create_sensor/1 with valid data creates a sensor" do
      assert {:ok, %Sensor{} = sensor} = Sensors.create_sensor(@valid_attrs)
      assert sensor.address == "some address"
      assert sensor.name == "some name"
    end

    test "create_sensor/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sensors.create_sensor(@invalid_attrs)
    end

    test "update_sensor/2 with valid data updates the sensor" do
      sensor = sensor_fixture()
      assert {:ok, %Sensor{} = sensor} = Sensors.update_sensor(sensor, @update_attrs)
      assert sensor.address == "some updated address"
      assert sensor.name == "some updated name"
    end

    test "update_sensor/2 with invalid data returns error changeset" do
      sensor = sensor_fixture()
      assert {:error, %Ecto.Changeset{}} = Sensors.update_sensor(sensor, @invalid_attrs)
      assert sensor == Sensors.get_sensor!(sensor.id)
    end

    test "delete_sensor/1 deletes the sensor" do
      sensor = sensor_fixture()
      assert {:ok, %Sensor{}} = Sensors.delete_sensor(sensor)
      assert_raise Ecto.NoResultsError, fn -> Sensors.get_sensor!(sensor.id) end
    end

    test "change_sensor/1 returns a sensor changeset" do
      sensor = sensor_fixture()
      assert %Ecto.Changeset{} = Sensors.change_sensor(sensor)
    end
  end
end
