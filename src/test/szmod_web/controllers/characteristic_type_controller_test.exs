defmodule SzmodWeb.CharacteristicTypeControllerTest do
  use SzmodWeb.ConnCase

  alias Szmod.Characteristics

  @create_attrs %{name: "some name", uuid: 42}
  @update_attrs %{name: "some updated name", uuid: 43}
  @invalid_attrs %{name: nil, uuid: nil}

  def fixture(:characteristic_type) do
    {:ok, characteristic_type} = Characteristics.create_characteristic_type(@create_attrs)
    characteristic_type
  end

  describe "index" do
    test "lists all characteristic_types", %{conn: conn} do
      conn = get(conn, Routes.characteristic_type_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Characteristic types"
    end
  end

  describe "new characteristic_type" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.characteristic_type_path(conn, :new))
      assert html_response(conn, 200) =~ "New Characteristic type"
    end
  end

  describe "create characteristic_type" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.characteristic_type_path(conn, :create), characteristic_type: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.characteristic_type_path(conn, :show, id)

      conn = get(conn, Routes.characteristic_type_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Characteristic type"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.characteristic_type_path(conn, :create), characteristic_type: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Characteristic type"
    end
  end

  describe "edit characteristic_type" do
    setup [:create_characteristic_type]

    test "renders form for editing chosen characteristic_type", %{conn: conn, characteristic_type: characteristic_type} do
      conn = get(conn, Routes.characteristic_type_path(conn, :edit, characteristic_type))
      assert html_response(conn, 200) =~ "Edit Characteristic type"
    end
  end

  describe "update characteristic_type" do
    setup [:create_characteristic_type]

    test "redirects when data is valid", %{conn: conn, characteristic_type: characteristic_type} do
      conn = put(conn, Routes.characteristic_type_path(conn, :update, characteristic_type), characteristic_type: @update_attrs)
      assert redirected_to(conn) == Routes.characteristic_type_path(conn, :show, characteristic_type)

      conn = get(conn, Routes.characteristic_type_path(conn, :show, characteristic_type))
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, characteristic_type: characteristic_type} do
      conn = put(conn, Routes.characteristic_type_path(conn, :update, characteristic_type), characteristic_type: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Characteristic type"
    end
  end

  describe "delete characteristic_type" do
    setup [:create_characteristic_type]

    test "deletes chosen characteristic_type", %{conn: conn, characteristic_type: characteristic_type} do
      conn = delete(conn, Routes.characteristic_type_path(conn, :delete, characteristic_type))
      assert redirected_to(conn) == Routes.characteristic_type_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.characteristic_type_path(conn, :show, characteristic_type))
      end
    end
  end

  defp create_characteristic_type(_) do
    characteristic_type = fixture(:characteristic_type)
    {:ok, characteristic_type: characteristic_type}
  end
end
