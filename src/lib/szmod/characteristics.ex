defmodule Szmod.Characteristics do
  @moduledoc """
  The Characteristics context.
  """

  import Ecto.Query, warn: false
  alias Szmod.Repo

  alias Szmod.Characteristics.CharacteristicType

  @doc """
  Returns the list of characteristic_types.

  ## Examples

      iex> list_characteristic_types()
      [%CharacteristicType{}, ...]

  """
  def list_characteristic_types do
    Repo.all(CharacteristicType)
  end

  @doc """
  Gets a single characteristic_type.

  Raises `Ecto.NoResultsError` if the Characteristic type does not exist.

  ## Examples

      iex> get_characteristic_type!(123)
      %CharacteristicType{}

      iex> get_characteristic_type!(456)
      ** (Ecto.NoResultsError)

  """
  def get_characteristic_type!(id), do: Repo.get!(CharacteristicType, id)

  @doc """
  Creates a characteristic_type.

  ## Examples

      iex> create_characteristic_type(%{field: value})
      {:ok, %CharacteristicType{}}

      iex> create_characteristic_type(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_characteristic_type(attrs \\ %{}) do
    %CharacteristicType{}
    |> CharacteristicType.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a characteristic_type.

  ## Examples

      iex> update_characteristic_type(characteristic_type, %{field: new_value})
      {:ok, %CharacteristicType{}}

      iex> update_characteristic_type(characteristic_type, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_characteristic_type(%CharacteristicType{} = characteristic_type, attrs) do
    characteristic_type
    |> CharacteristicType.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a CharacteristicType.

  ## Examples

      iex> delete_characteristic_type(characteristic_type)
      {:ok, %CharacteristicType{}}

      iex> delete_characteristic_type(characteristic_type)
      {:error, %Ecto.Changeset{}}

  """
  def delete_characteristic_type(%CharacteristicType{} = characteristic_type) do
    Repo.delete(characteristic_type)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking characteristic_type changes.

  ## Examples

      iex> change_characteristic_type(characteristic_type)
      %Ecto.Changeset{source: %CharacteristicType{}}

  """
  def change_characteristic_type(%CharacteristicType{} = characteristic_type) do
    CharacteristicType.changeset(characteristic_type, %{})
  end

  alias Szmod.Characteristics.Characteristic

  @doc """
  Returns the list of characteristics.

  ## Examples

      iex> list_characteristics()
      [%Characteristic{}, ...]

  """
  def list_characteristics do
    Repo.all(Characteristic)
  end

  @doc """
  Gets a single characteristic.

  Raises `Ecto.NoResultsError` if the Characteristic does not exist.

  ## Examples

      iex> get_characteristic!(123)
      %Characteristic{}

      iex> get_characteristic!(456)
      ** (Ecto.NoResultsError)

  """
  def get_characteristic!(id), do: Repo.get!(Characteristic, id)

  @doc """
  Creates a characteristic.

  ## Examples

      iex> create_characteristic(%{field: value})
      {:ok, %Characteristic{}}

      iex> create_characteristic(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_characteristic(attrs \\ %{}) do
    %Characteristic{}
    |> Characteristic.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a characteristic.

  ## Examples

      iex> update_characteristic(characteristic, %{field: new_value})
      {:ok, %Characteristic{}}

      iex> update_characteristic(characteristic, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_characteristic(%Characteristic{} = characteristic, attrs) do
    characteristic
    |> Characteristic.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Characteristic.

  ## Examples

      iex> delete_characteristic(characteristic)
      {:ok, %Characteristic{}}

      iex> delete_characteristic(characteristic)
      {:error, %Ecto.Changeset{}}

  """
  def delete_characteristic(%Characteristic{} = characteristic) do
    Repo.delete(characteristic)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking characteristic changes.

  ## Examples

      iex> change_characteristic(characteristic)
      %Ecto.Changeset{source: %Characteristic{}}

  """
  def change_characteristic(%Characteristic{} = characteristic) do
    Characteristic.changeset(characteristic, %{})
  end
end
