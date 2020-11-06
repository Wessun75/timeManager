defmodule TodolistWeb.UserView do
  use TodolistWeb, :view
  alias TodolistWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{
      id: user.id,
      username: user.username,
      role: user.role,
      team_id: user.team_id,
      manage_id: user.manage_id,
    }
  end

  def render("login.json", %{user: user, jwt: jwt}) do
    %{
      jwt: jwt,
      user: %{
        id: user.id,
        username: user.username,
        role: user.role,
        team_id: user.team_id,
        manage_id: user.manage_id,
      }
    }
  end

  def render("jwt.json", %{jwt: jwt}) do
    %{jwt: jwt}
  end
end
