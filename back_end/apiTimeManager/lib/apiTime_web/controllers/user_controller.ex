defmodule TodolistWeb.UserController do
  use TodolistWeb, :controller

  alias Todolist.Accounts
  alias Todolist.Accounts.User

  action_fallback TodolistWeb.FallbackController

  def index(conn, _params) do
    users = Accounts.list_users()
    render(conn, "index.json", users: users)
  end

  def index_by(conn, %{"password" => password}) do
    with {:ok, %User{} = user} <- Accounts.connect(password) do
      conn
      |> render(conn, "show.json", user: user)
    end
  end

  def create(conn, params) do
    with {:ok, %User{} = user} <- Accounts.create_user(params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.user_path(conn, :show, user))
      case Accounts.sign_in(user.username, user.password) do
        {:ok, token, _claims} ->
          render(conn, "login.json", %{user: user, jwt: token})
        _ ->
          {:error, :unauthorized}
      end
    end
  end

  def show(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    render(conn, "show.json", user: user)
  end

  def sign_in(conn, %{"username" => username, "password" => password}) do
    case Accounts.username_password_auth(username, password) do
      {:ok, user} ->
        case Accounts.sign_in(username, password) do
          {:ok, token, _claims} ->
            render(conn, "login.json", %{user: user, jwt: token})
          _ ->
            {:error, :unauthorized}
        end
      _ ->
        {:error, :unauthorized}
    end
  end

  def update(conn, %{"id" => id, "params" => params}) do
    user = Accounts.get_user!(id)
    with {:ok, %User{} = user} <- Accounts.update_user(user, params) do
      render(conn, "show.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)

    with {:ok, %User{}} <- Accounts.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end
end
