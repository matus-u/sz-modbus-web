defmodule SzmodWeb.SensorTypeControllerTest do
  use SzmodWeb.ConnCase

  alias Szmod.Sensors

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  def fixture(:sensor_type) do
    {:ok, sensor_type} = Sensors.create_sensor_type(@create_attrs)
    sensor_type
  end

  describe "index" do
    test "lists all sensor_types", %{conn: conn} do
      conn = get(conn, Routes.sensor_type_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Sensor types"
    end
  end

  describe "new sensor_type" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.sensor_type_path(conn, :new))
      assert html_response(conn, 200) =~ "New Sensor type"
    end
  end

  describe "create sensor_type" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.sensor_type_path(conn, :create), sensor_type: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.sensor_type_path(conn, :show, id)

      conn = get(conn, Routes.sensor_type_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Sensor type"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.sensor_type_path(conn, :create), sensor_type: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Sensor type"
    end
  end

  describe "edit sensor_type" do
    setup [:create_sensor_type]

    test "renders form for editing chosen sensor_type", %{conn: conn, sensor_type: sensor_type} do
      conn = get(conn, Routes.sensor_type_path(conn, :edit, sensor_type))
      assert html_response(conn, 200) =~ "Edit Sensor type"
    end
  end

  describe "update sensor_type" do
    setup [:create_sensor_type]

    test "redirects when data is valid", %{conn: conn, sensor_type: sensor_type} do
      conn = put(conn, Routes.sensor_type_path(conn, :update, sensor_type), sensor_type: @update_attrs)
      assert redirected_to(conn) == Routes.sensor_type_path(conn, :show, sensor_type)

      conn = get(conn, Routes.sensor_type_path(conn, :show, sensor_type))
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, sensor_type: sensor_type} do
      conn = put(conn, Routes.sensor_type_path(conn, :update, sensor_type), sensor_type: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Sensor type"
    end
  end

  describe "delete sensor_type" do
    setup [:create_sensor_type]

    test "deletes chosen sensor_type", %{conn: conn, sensor_type: sensor_type} do
      conn = delete(conn, Routes.sensor_type_path(conn, :delete, sensor_type))
      assert redirected_to(conn) == Routes.sensor_type_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.sensor_type_path(conn, :show, sensor_type))
      end
    end
  end

  defp create_sensor_type(_) do
    sensor_type = fixture(:sensor_type)
    {:ok, sensor_type: sensor_type}
  end
end
