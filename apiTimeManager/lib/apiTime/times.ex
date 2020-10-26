defmodule Todolist.Times do
  @moduledoc """
  The Times context.
  """

  import Ecto.Query, warn: false
  alias Todolist.Repo

  alias Todolist.Times.Clock
  alias Todolist.Worktime.Workingtime

  @doc """
  Returns the list of clocks.

  ## Examples

      iex> list_clocks()
      [%Clock{}, ...]

  """
  def list_clocks do
    Repo.all(Clock)
  end

  @doc """
  Gets a single clock.

  Raises `Ecto.NoResultsError` if the Clock does not exist.

  ## Examples

      iex> get_clock!(123)
      %Clock{}

      iex> get_clock!(456)
      ** (Ecto.NoResultsError)

  """
  def get_clock!(user_id) do
    Repo.get_by(Clock, user_id: user_id)
  end

  @doc """
  Creates a clock.

  ## Examples

      iex> create_clock(%{field: value})
      {:ok, %Clock{}}

      iex> create_clock(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_clock(user_id \\ %{}) do
    convert_to_integer = String.to_integer(user_id)
    user =
      case Repo.get_by(Clock, user_id: user_id) do
        nil -> %Clock{status: false}
        clock -> clock
      end
    %Workingtime{}

    if user.status == false do
      %Workingtime{user_id: convert_to_integer, start: user.time, end: NaiveDateTime.local_now}
      |> Repo.insert()
    end
    %Clock{}
    case Repo.get_by(Clock, user_id: user_id) do
      nil -> %Clock{user_id: user_id}
      clock -> clock
    end
    |> Clock.changeset(
         %{
           time: DateTime.utc_now,
           status: !user.status,
           user_id: user_id
         }
       )
    |> Repo.insert_or_update()

  end

  @doc """
  Updates a clock.

  ## Examples

      iex> update_clock(clock, %{field: new_value})
      {:ok, %Clock{}}

      iex> update_clock(clock, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_clock(%Clock{} = clock, attrs) do
    clock
    |> Clock.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a clock.

  ## Examples

      iex> delete_clock(clock)
      {:ok, %Clock{}}

      iex> delete_clock(clock)
      {:error, %Ecto.Changeset{}}

  """
  def delete_clock(%Clock{} = clock) do
    Repo.delete(clock)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking clock changes.

  ## Examples

      iex> change_clock(clock)
      %Ecto.Changeset{data: %Clock{}}

  """
  def change_clock(%Clock{} = clock, attrs \\ %{}) do
    Clock.changeset(clock, attrs)
  end
end
