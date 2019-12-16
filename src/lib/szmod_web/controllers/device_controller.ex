defmodule SzmodWeb.DeviceController do
  use SzmodWeb, :controller

  alias Szmod.App
  alias Szmod.App.Device

  def index(conn, _params) do
    devices = App.list_devices()
    render(conn, "index.html", devices: devices)
  end

  def new(conn, _params) do
    changeset = App.change_device(%Device{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"device" => device_params}) do
    case App.create_device(device_params) do
      {:ok, device} ->
        conn
        |> put_flash(:info, "Device created successfully.")
        |> redirect(to: Routes.device_path(conn, :show, device))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    device = App.get_device!(id) |> Szmod.Repo.preload(:sensors) |> Szmod.Repo.preload(sensors: :sensor_type)
    render(conn, "show.html", device: device)
  end

  def edit(conn, %{"id" => id}) do
    device = App.get_device!(id)
    changeset = App.change_device(device)
    render(conn, "edit.html", device: device, changeset: changeset)
  end

  def update(conn, %{"id" => id, "device" => device_params}) do
    device = App.get_device!(id)

    case App.update_device(device, device_params) do
      {:ok, device} ->
        conn
        |> put_flash(:info, "Device updated successfully.")
        |> redirect(to: Routes.device_path(conn, :show, device))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", device: device, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    device = App.get_device!(id)
    {:ok, _device} = App.delete_device(device)

    conn
    |> put_flash(:info, "Device deleted successfully.")
    |> redirect(to: Routes.device_path(conn, :index))
  end
end
