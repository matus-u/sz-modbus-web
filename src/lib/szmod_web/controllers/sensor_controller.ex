defmodule SzmodWeb.SensorController do
  use SzmodWeb, :controller
  import Ecto.Query

  alias Szmod.Sensors
  alias Szmod.Sensors.Sensor

  def index(conn, _params) do
    sensors = Sensors.list_sensors()
    render(conn, "index.html", sensors: sensors)
  end

  def new(conn, _params) do
    changeset = Sensors.change_sensor(%Sensor{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"sensor" => sensor_params}) do
    case Sensors.create_sensor(sensor_params) do
      {:ok, sensor} ->
        conn
        |> put_flash(:info, "Sensor created successfully.")
        |> redirect(to: Routes.sensor_path(conn, :show, sensor))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do

    sensor = Sensors.get_sensor!(id) |> Szmod.Repo.preload([:device, :sensor_type]) |> Szmod.Repo.preload([characteristics: (from ch in Szmod.Characteristics.Characteristic, distinct: ch.characteristic_type_id)])

    chars = Enum.map(sensor.characteristics,
        fn x -> Szmod.Characteristics.Characteristic |> where([c], c.characteristic_type_id == ^x.characteristic_type_id and c.sensor_id == ^id) |>  order_by(desc: :inserted_at) |> limit(10) |> Szmod.Repo.all  |> Szmod.Repo.preload(:characteristic_type) end)

    render(conn, "show.html", sensor: sensor, chars: chars)
  end

  def edit(conn, %{"id" => id}) do
    sensor = Sensors.get_sensor!(id)
    changeset = Sensors.change_sensor(sensor)
    render(conn, "edit.html", sensor: sensor, changeset: changeset)
  end

  def update(conn, %{"id" => id, "sensor" => sensor_params}) do
    sensor = Sensors.get_sensor!(id)

    case Sensors.update_sensor(sensor, sensor_params) do
      {:ok, sensor} ->
        conn
        |> put_flash(:info, "Sensor updated successfully.")
        |> redirect(to: Routes.sensor_path(conn, :show, sensor))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", sensor: sensor, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    sensor = Sensors.get_sensor!(id)
    {:ok, _sensor} = Sensors.delete_sensor(sensor)

    conn
    |> put_flash(:info, "Sensor deleted successfully.")
    |> redirect(to: Routes.sensor_path(conn, :index))
  end
end
