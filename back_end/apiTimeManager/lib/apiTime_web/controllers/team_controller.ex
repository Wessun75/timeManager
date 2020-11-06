defmodule TodolistWeb.TeamController do
  use TodolistWeb, :controller

  alias Todolist.Group
  alias Todolist.Group.Team

  action_fallback TodolistWeb.FallbackController

  def index(conn, _params) do
    teams = Group.list_teams()
    render(conn, "index.json", teams: teams)
  end

  def create(conn, params) do
    bearer_token = List.first(get_req_header(conn, "authorization"))
    case Todolist.Token.verify_and_validate(bearer_token) do
      {:error, err} ->
        {:error, :unauthorized}
      {:ok, work} ->
        with {:ok, %Team{} = team} <- Group.create_team(params) do
          conn
          |> put_status(:created)
          |> put_resp_header("location", Routes.team_path(conn, :show, team))
          |> render("show.json", team: team)
        end
    end
  end

  def show(conn, %{"id" => id}) do
    team = Group.get_team!(id)
    render(conn, "show.json", team: team)
  end

  def get_manager_teams(conn, %{"user_id" => id}) do
    user = Todolist.Accounts.get_user!(id)
    teams = Group.get_teams_by_ids!(user.manage_id)
    render(conn, "index.json", teams: teams)
  end

  def update(conn, %{"id" => id, "team" => team_params}) do
    team = Group.get_team!(id)

    with {:ok, %Team{} = team} <- Group.update_team(team, team_params) do
      render(conn, "show.json", team: team)
    end
  end

  def delete(conn, %{"id" => id}) do
    team = Group.get_team!(id)

    with {:ok, %Team{}} <- Group.delete_team(team) do
      send_resp(conn, :no_content, "")
    end
  end
end
