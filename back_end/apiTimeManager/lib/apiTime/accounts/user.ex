defmodule Todolist.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
<<<<<<< HEAD
    field :email, :string
    field :username, :string
=======
    field :username, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :team_id, :integer
    field :manage_id, {:array, :integer}
    field :role, :integer, default: 1
>>>>>>> 0660e152e3889ae9444668d7656a21bed437d07e

    timestamps()
  end

<<<<<<< HEAD
  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :email])
    |> validate_required([:username, :email])
  end
=======
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :password, :role, :manage_id, :team_id])
  end

  def update_changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :password, :role, :manage_id, :team_id])
    |> put_pass_hash()
  end

  def registration_changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :password, :role, :manage_id, :team_id])
    |> validate_required([:username, :password])
    |> unique_constraint(:username, message: "username existe déjà")
    |> put_pass_hash()
  end

  defp put_pass_hash(changeset) do
    case changeset do
      %Ecto.Changeset{
        changes: %{
          password: password
        }
      } ->
        change(changeset, Bcrypt.add_hash(password))
      _ -> changeset
    end
  end

>>>>>>> 0660e152e3889ae9444668d7656a21bed437d07e
end
