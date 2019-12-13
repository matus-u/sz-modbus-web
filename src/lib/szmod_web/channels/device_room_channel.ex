defmodule SzmodWeb.DeviceRoomChannel do
  use SzmodWeb, :channel

  alias Szmod.App
  alias Szmod.App.Device
  alias Szmod.Sensors.Sensor
  alias Szmod.Sensors.SensorType
  alias Szmod.Sensors.Characteristic
  alias Szmod.Repo

  def join("device_room:" <> id, payload, socket) do
    IO.puts id
    IO.puts payload
    if authorized?(payload) do
      {:ok, socket}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  def update_or_create_device(id, name) do
    case Repo.get_by(Device, uuid: id) do
        device when is_map(device) ->
            with {:ok, %Device{} = device} <- App.update_device(device, %{name: name}) do
            device
            end
        nil ->
            with {:ok, %Device{} = device} <- App.create_device(%{name: name, uuid: id}) do
            device
            end
    end
  end

  def update_or_create_sensor(id, name, address, sensorType) do
  end

  def handle_sensors(device, %{"Name" => name, "DevType" => sType, "Address" => address, "Id" => id, "LiveData" => live_data}) do
        IO.puts "#{name} --> #{sType} --> #{id} --> #{address}"
        for %{"name" => charName, "charType" => charType, "unit" => charUnit, "value" => charValue} <- live_data do
            IO.puts "#{charName} --> #{charType} --> #{charUnit} --> #{charValue}"
        end
  end


  def handle_in("data-message", %{"id" => dev_id, "name" => dev_name, "data" => data}, socket) do
    IO.puts dev_id
    IO.puts dev_name
    dev = update_or_create_device(dev_id, dev_name)
    Enum.each(data, fn sensor -> handle_sensors(dev, sensor) end)

    {:reply, {:ok, %{msg_type: "data-message"}}, socket}
  end

  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client
  def handle_in("ping", payload, socket) do
    {:reply, {:ok, payload}, socket}
  end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (device_room:lobby).
  def handle_in("shout", payload, socket) do
    broadcast socket, "shout", payload
    {:noreply, socket}
  end

  # Add authorization logic here as required.
  defp authorized?(_payload) do
    true
  end
end
