defmodule TodolistWeb.UserController do
  use TodolistWeb, :controller

  alias Todolist.Accounts
  alias Todolist.Accounts.User

  action_fallback TodolistWeb.FallbackController

  def index(conn, %{"email" => email, "username" => username}) do
    users = Accounts.list_users_by_email_username(email, username)
    render(conn, "show.json", user: users)
  end

  def index(conn, _params) do
    users = Accounts.list_users()
    render(conn, "index.json", users: users)
  end

<<<<<<< HEAD
  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Accounts.create_user(user_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.user_path(conn, :show, user))
      |> render("show.json", user: user)
=======
  def create(conn, params) do
    with {:ok, %User{} = user} <- Accounts.create_user(params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.user_path(conn, :show, user))
      |> resp(200, "Account created")
      |> send_resp()
>>>>>>> 0660e152e3889ae9444668d7656a21bed437d07e
    end
  end

  def show(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    render(conn, "show.json", user: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Accounts.get_user!(id)
<<<<<<< HEAD

=======
>>>>>>> 0660e152e3889ae9444668d7656a21bed437d07e
    with {:ok, %User{} = user} <- Accounts.update_user(user, user_params) do
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
