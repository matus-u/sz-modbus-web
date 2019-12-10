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
end
