defmodule SzmodWeb.DeviceRoomChannel do
  use SzmodWeb, :channel

  alias Szmod.App
  alias Szmod.App.Device
  alias Szmod.Sensors
  alias Szmod.Sensors.Sensor
  alias Szmod.Sensors.SensorType
  alias Szmod.Characteristics.Characteristic
  alias Szmod.Characteristics.CharacteristicType

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
            App.update_device(device, %{name: name})
        nil ->
            App.create_device(%{name: name, uuid: id})
    end
  end

  def update_or_create_sensor(device, id, name, address, sensorType) do
    case Repo.get_by(Sensor, uuid: id) do
        sensor when is_map(sensor) ->
            Sensors.update_sensor(sensor, %{name: name, address: address})
        nil ->
            sensorTypeObj = Repo.get_by!(SensorType, name: sensorType)
            %Sensor{}
            |> Sensor.changeset(%{uuid: id, address: address, name: name, enabled: true})
            |> Ecto.Changeset.put_assoc(:device, device )
            |> Ecto.Changeset.put_assoc(:sensor_type, sensorTypeObj)
            |> Repo.insert()
    end
  end

  def handle_characteristic(sensor, %{"charType" => charType, "unit" => charUnit, "value" => charValue}) do
        with {floatValue, _} <- Float.parse(charValue)
        do
            charTypeObj = Repo.get_by!(CharacteristicType, uuid: charType)
            %Characteristic{}
            |> Characteristic.changeset(%{value: floatValue, unit: charUnit})
            |> Ecto.Changeset.put_assoc(:characteristic_type, charTypeObj )
            |> Ecto.Changeset.put_assoc(:sensor, sensor)
            |> Repo.insert()
        end
  end

  def handle_sensors(device, %{"Name" => name, "DevType" => sType, "Address" => address, "Id" => id, "LiveData" => live_data}) do
        #IO.puts "#{name} --> #{sType} --> #{id} --> #{address}"
        {:ok, sensor} = update_or_create_sensor(device, id, name, address, sType)
        Enum.each(live_data, fn charac -> handle_characteristic(sensor, charac) end)
  end


  def handle_in("data-message", %{"id" => dev_id, "name" => dev_name, "data" => data}, socket) do
    {:ok, dev } = update_or_create_device(dev_id, dev_name)
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
