defmodule SzmodWeb.CharacteristicController do
  use SzmodWeb, :controller

  alias Szmod.Characteristics
  alias Szmod.Characteristics.Characteristic

  def index(conn, _params) do
    characteristics = Characteristics.list_characteristics()
    render(conn, "index.html", characteristics: characteristics)
  end

  def new(conn, _params) do
    changeset = Characteristics.change_characteristic(%Characteristic{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"characteristic" => characteristic_params}) do
    case Characteristics.create_characteristic(characteristic_params) do
      {:ok, characteristic} ->
        conn
        |> put_flash(:info, "Characteristic created successfully.")
        |> redirect(to: Routes.characteristic_path(conn, :show, characteristic))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    characteristic = Characteristics.get_characteristic!(id)
    render(conn, "show.html", characteristic: characteristic)
  end

  def edit(conn, %{"id" => id}) do
    characteristic = Characteristics.get_characteristic!(id)
    changeset = Characteristics.change_characteristic(characteristic)
    render(conn, "edit.html", characteristic: characteristic, changeset: changeset)
  end

  def update(conn, %{"id" => id, "characteristic" => characteristic_params}) do
    characteristic = Characteristics.get_characteristic!(id)

    case Characteristics.update_characteristic(characteristic, characteristic_params) do
      {:ok, characteristic} ->
        conn
        |> put_flash(:info, "Characteristic updated successfully.")
        |> redirect(to: Routes.characteristic_path(conn, :show, characteristic))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", characteristic: characteristic, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    characteristic = Characteristics.get_characteristic!(id)
    {:ok, _characteristic} = Characteristics.delete_characteristic(characteristic)

    conn
    |> put_flash(:info, "Characteristic deleted successfully.")
    |> redirect(to: Routes.characteristic_path(conn, :index))
  end
end
