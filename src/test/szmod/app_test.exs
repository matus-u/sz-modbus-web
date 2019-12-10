defmodule Szmod.AppTest do
  use Szmod.DataCase

  alias Szmod.App

  describe "devices" do
    alias Szmod.App.Device

    @valid_attrs %{name: "some name", uuid: "some uuid"}
    @update_attrs %{name: "some updated name", uuid: "some updated uuid"}
    @invalid_attrs %{name: nil, uuid: nil}

    def device_fixture(attrs \\ %{}) do
      {:ok, device} =
        attrs
        |> Enum.into(@valid_attrs)
        |> App.create_device()

      device
    end

    test "list_devices/0 returns all devices" do
      device = device_fixture()
      assert App.list_devices() == [device]
    end

    test "get_device!/1 returns the device with given id" do
      device = device_fixture()
      assert App.get_device!(device.id) == device
    end

    test "create_device/1 with valid data creates a device" do
      assert {:ok, %Device{} = device} = App.create_device(@valid_attrs)
      assert device.name == "some name"
      assert device.uuid == "some uuid"
    end

    test "create_device/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = App.create_device(@invalid_attrs)
    end

    test "update_device/2 with valid data updates the device" do
      device = device_fixture()
      assert {:ok, %Device{} = device} = App.update_device(device, @update_attrs)
      assert device.name == "some updated name"
      assert device.uuid == "some updated uuid"
    end

    test "update_device/2 with invalid data returns error changeset" do
      device = device_fixture()
      assert {:error, %Ecto.Changeset{}} = App.update_device(device, @invalid_attrs)
      assert device == App.get_device!(device.id)
    end

    test "delete_device/1 deletes the device" do
      device = device_fixture()
      assert {:ok, %Device{}} = App.delete_device(device)
      assert_raise Ecto.NoResultsError, fn -> App.get_device!(device.id) end
    end

    test "change_device/1 returns a device changeset" do
      device = device_fixture()
      assert %Ecto.Changeset{} = App.change_device(device)
    end
  end
end
