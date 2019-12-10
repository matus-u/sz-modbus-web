defmodule SzmodWeb.SensorTypeController do
  use SzmodWeb, :controller

  alias Szmod.Sensors
  alias Szmod.Sensors.SensorType

  def index(conn, _params) do
    sensor_types = Sensors.list_sensor_types()
    render(conn, "index.html", sensor_types: sensor_types)
  end

  def new(conn, _params) do
    changeset = Sensors.change_sensor_type(%SensorType{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"sensor_type" => sensor_type_params}) do
    case Sensors.create_sensor_type(sensor_type_params) do
      {:ok, sensor_type} ->
        conn
        |> put_flash(:info, "Sensor type created successfully.")
        |> redirect(to: Routes.sensor_type_path(conn, :show, sensor_type))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    sensor_type = Sensors.get_sensor_type!(id)
    render(conn, "show.html", sensor_type: sensor_type)
  end

  def edit(conn, %{"id" => id}) do
    sensor_type = Sensors.get_sensor_type!(id)
    changeset = Sensors.change_sensor_type(sensor_type)
    render(conn, "edit.html", sensor_type: sensor_type, changeset: changeset)
  end

  def update(conn, %{"id" => id, "sensor_type" => sensor_type_params}) do
    sensor_type = Sensors.get_sensor_type!(id)

    case Sensors.update_sensor_type(sensor_type, sensor_type_params) do
      {:ok, sensor_type} ->
        conn
        |> put_flash(:info, "Sensor type updated successfully.")
        |> redirect(to: Routes.sensor_type_path(conn, :show, sensor_type))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", sensor_type: sensor_type, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    sensor_type = Sensors.get_sensor_type!(id)
    {:ok, _sensor_type} = Sensors.delete_sensor_type(sensor_type)

    conn
    |> put_flash(:info, "Sensor type deleted successfully.")
    |> redirect(to: Routes.sensor_type_path(conn, :index))
  end
end
