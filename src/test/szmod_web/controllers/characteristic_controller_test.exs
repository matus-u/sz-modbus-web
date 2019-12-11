defmodule SzmodWeb.CharacteristicControllerTest do
  use SzmodWeb.ConnCase

  alias Szmod.Characteristics

  @create_attrs %{unit: "some unit", value: 120.5}
  @update_attrs %{unit: "some updated unit", value: 456.7}
  @invalid_attrs %{unit: nil, value: nil}

  def fixture(:characteristic) do
    {:ok, characteristic} = Characteristics.create_characteristic(@create_attrs)
    characteristic
  end

  describe "index" do
    test "lists all characteristics", %{conn: conn} do
      conn = get(conn, Routes.characteristic_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Characteristics"
    end
  end

  describe "new characteristic" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.characteristic_path(conn, :new))
      assert html_response(conn, 200) =~ "New Characteristic"
    end
  end

  describe "create characteristic" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.characteristic_path(conn, :create), characteristic: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.characteristic_path(conn, :show, id)

      conn = get(conn, Routes.characteristic_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Characteristic"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.characteristic_path(conn, :create), characteristic: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Characteristic"
    end
  end

  describe "edit characteristic" do
    setup [:create_characteristic]

    test "renders form for editing chosen characteristic", %{conn: conn, characteristic: characteristic} do
      conn = get(conn, Routes.characteristic_path(conn, :edit, characteristic))
      assert html_response(conn, 200) =~ "Edit Characteristic"
    end
  end

  describe "update characteristic" do
    setup [:create_characteristic]

    test "redirects when data is valid", %{conn: conn, characteristic: characteristic} do
      conn = put(conn, Routes.characteristic_path(conn, :update, characteristic), characteristic: @update_attrs)
      assert redirected_to(conn) == Routes.characteristic_path(conn, :show, characteristic)

      conn = get(conn, Routes.characteristic_path(conn, :show, characteristic))
      assert html_response(conn, 200) =~ "some updated unit"
    end

    test "renders errors when data is invalid", %{conn: conn, characteristic: characteristic} do
      conn = put(conn, Routes.characteristic_path(conn, :update, characteristic), characteristic: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Characteristic"
    end
  end

  describe "delete characteristic" do
    setup [:create_characteristic]

    test "deletes chosen characteristic", %{conn: conn, characteristic: characteristic} do
      conn = delete(conn, Routes.characteristic_path(conn, :delete, characteristic))
      assert redirected_to(conn) == Routes.characteristic_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.characteristic_path(conn, :show, characteristic))
      end
    end
  end

  defp create_characteristic(_) do
    characteristic = fixture(:characteristic)
    {:ok, characteristic: characteristic}
  end
end
