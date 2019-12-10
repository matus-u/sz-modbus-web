defmodule SzmodWeb.CharacteristicTypeController do
  use SzmodWeb, :controller

  alias Szmod.Characteristics
  alias Szmod.Characteristics.CharacteristicType

  def index(conn, _params) do
    characteristic_types = Characteristics.list_characteristic_types()
    render(conn, "index.html", characteristic_types: characteristic_types)
  end

  def new(conn, _params) do
    changeset = Characteristics.change_characteristic_type(%CharacteristicType{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"characteristic_type" => characteristic_type_params}) do
    case Characteristics.create_characteristic_type(characteristic_type_params) do
      {:ok, characteristic_type} ->
        conn
        |> put_flash(:info, "Characteristic type created successfully.")
        |> redirect(to: Routes.characteristic_type_path(conn, :show, characteristic_type))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    characteristic_type = Characteristics.get_characteristic_type!(id)
    render(conn, "show.html", characteristic_type: characteristic_type)
  end

  def edit(conn, %{"id" => id}) do
    characteristic_type = Characteristics.get_characteristic_type!(id)
    changeset = Characteristics.change_characteristic_type(characteristic_type)
    render(conn, "edit.html", characteristic_type: characteristic_type, changeset: changeset)
  end

  def update(conn, %{"id" => id, "characteristic_type" => characteristic_type_params}) do
    characteristic_type = Characteristics.get_characteristic_type!(id)

    case Characteristics.update_characteristic_type(characteristic_type, characteristic_type_params) do
      {:ok, characteristic_type} ->
        conn
        |> put_flash(:info, "Characteristic type updated successfully.")
        |> redirect(to: Routes.characteristic_type_path(conn, :show, characteristic_type))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", characteristic_type: characteristic_type, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    characteristic_type = Characteristics.get_characteristic_type!(id)
    {:ok, _characteristic_type} = Characteristics.delete_characteristic_type(characteristic_type)

    conn
    |> put_flash(:info, "Characteristic type deleted successfully.")
    |> redirect(to: Routes.characteristic_type_path(conn, :index))
  end
end
