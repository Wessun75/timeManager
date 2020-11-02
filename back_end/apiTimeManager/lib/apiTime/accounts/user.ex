defmodule Todolist.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :username, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :team_id, :integer
    field :manage_id, {:array, :integer}
    field :role, :integer, default: 1

    timestamps()
  end

  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :password, :role, :manage_id, :team_id])
    |> put_pass_hash()
  end

  def registration_changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :password, :role, :manage_id, :team_id])
    |> validate_required([:username, :password])
    |> check_constraint(:username, name: :username)
    |> put_pass_hash()
  end

  defp put_pass_hash(changeset) do
    case changeset do
      %Ecto.Changeset{
        valid?: true,
        changes: %{
          password: password
        }
      } ->
        change(changeset, Bcrypt.add_hash(password))
      _ -> changeset
    end
  end

end
