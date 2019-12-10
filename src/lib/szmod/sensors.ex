defmodule Szmod.Sensors do
  @moduledoc """
  The Sensors context.
  """

  import Ecto.Query, warn: false
  alias Szmod.Repo

  alias Szmod.Sensors.SensorType

  @doc """
  Returns the list of sensor_types.

  ## Examples

      iex> list_sensor_types()
      [%SensorType{}, ...]

  """
  def list_sensor_types do
    Repo.all(SensorType)
  end

  @doc """
  Gets a single sensor_type.

  Raises `Ecto.NoResultsError` if the Sensor type does not exist.

  ## Examples

      iex> get_sensor_type!(123)
      %SensorType{}

      iex> get_sensor_type!(456)
      ** (Ecto.NoResultsError)

  """
  def get_sensor_type!(id), do: Repo.get!(SensorType, id)

  @doc """
  Creates a sensor_type.

  ## Examples

      iex> create_sensor_type(%{field: value})
      {:ok, %SensorType{}}

      iex> create_sensor_type(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_sensor_type(attrs \\ %{}) do
    %SensorType{}
    |> SensorType.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a sensor_type.

  ## Examples

      iex> update_sensor_type(sensor_type, %{field: new_value})
      {:ok, %SensorType{}}

      iex> update_sensor_type(sensor_type, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_sensor_type(%SensorType{} = sensor_type, attrs) do
    sensor_type
    |> SensorType.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a SensorType.

  ## Examples

      iex> delete_sensor_type(sensor_type)
      {:ok, %SensorType{}}

      iex> delete_sensor_type(sensor_type)
      {:error, %Ecto.Changeset{}}

  """
  def delete_sensor_type(%SensorType{} = sensor_type) do
    Repo.delete(sensor_type)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking sensor_type changes.

  ## Examples

      iex> change_sensor_type(sensor_type)
      %Ecto.Changeset{source: %SensorType{}}

  """
  def change_sensor_type(%SensorType{} = sensor_type) do
    SensorType.changeset(sensor_type, %{})
  end

  alias Szmod.Sensors.Sensor

  @doc """
  Returns the list of sensors.

  ## Examples

      iex> list_sensors()
      [%Sensor{}, ...]

  """
  def list_sensors do
    Repo.all(Sensor)
  end

  @doc """
  Gets a single sensor.

  Raises `Ecto.NoResultsError` if the Sensor does not exist.

  ## Examples

      iex> get_sensor!(123)
      %Sensor{}

      iex> get_sensor!(456)
      ** (Ecto.NoResultsError)

  """
  def get_sensor!(id), do: Repo.get!(Sensor, id)

  @doc """
  Creates a sensor.

  ## Examples

      iex> create_sensor(%{field: value})
      {:ok, %Sensor{}}

      iex> create_sensor(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_sensor(attrs \\ %{}) do
    %Sensor{}
    |> Sensor.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a sensor.

  ## Examples

      iex> update_sensor(sensor, %{field: new_value})
      {:ok, %Sensor{}}

      iex> update_sensor(sensor, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_sensor(%Sensor{} = sensor, attrs) do
    sensor
    |> Sensor.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Sensor.

  ## Examples

      iex> delete_sensor(sensor)
      {:ok, %Sensor{}}

      iex> delete_sensor(sensor)
      {:error, %Ecto.Changeset{}}

  """
  def delete_sensor(%Sensor{} = sensor) do
    Repo.delete(sensor)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking sensor changes.

  ## Examples

      iex> change_sensor(sensor)
      %Ecto.Changeset{source: %Sensor{}}

  """
  def change_sensor(%Sensor{} = sensor) do
    Sensor.changeset(sensor, %{})
  end
end
