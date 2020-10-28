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

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :password])
    |> validate_required([:username, :password])
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
