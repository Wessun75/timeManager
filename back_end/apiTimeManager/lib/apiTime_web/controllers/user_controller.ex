defmodule TodolistWeb.UserController do
  use TodolistWeb, :controller

  alias Todolist.Accounts
  alias Todolist.Accounts.User

  action_fallback TodolistWeb.FallbackController

  def index(conn, %{"password" => password}) do
    with {:ok, %User{} = user} <- Accounts.connect(password) do
      conn
      |> render(conn, "show.json", user: user)
    end
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

  def sign_in(conn, %{"username" => username, "password" => password}) do
    case Accounts.sign_in(username, password) do
      {:ok, token, _claims} ->
        conn
        |> render("jwt.json", jwt: token)
      _ ->
        {:error, :unauthorized}
    end
  end

  def update(conn, %{"id" => id, "params" => params}) do
    user = Accounts.get_user!(id)
<<<<<<< HEAD
<<<<<<< HEAD

=======
>>>>>>> 0660e152e3889ae9444668d7656a21bed437d07e
    with {:ok, %User{} = user} <- Accounts.update_user(user, user_params) do
=======
    with {:ok, %User{} = user} <- Accounts.update_user(user, params) do
>>>>>>> 183d15adb381a09d2ccfc15618db2364e01a1978
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
