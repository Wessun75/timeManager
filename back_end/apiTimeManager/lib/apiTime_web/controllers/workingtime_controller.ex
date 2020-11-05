defmodule TodolistWeb.WorkingtimeController do
  use TodolistWeb, :controller

  alias Todolist.Worktime
  alias Todolist.Worktime.Workingtime

  action_fallback TodolistWeb.FallbackController

  def index(conn, _params) do
    workingtimes = Worktime.list_workingtimes()
    render(conn, "index.json", workingtimes: workingtimes)
  end

  def index(conn, %{"user_id" => user_id, "start" => start, "end" => ends}) do
    workingtimes = Worktime.list_workingtimes_start_end(user_id, start, ends)
    render(conn, "index.json", workingtimes: workingtimes)
  end

  def create(conn, %{"user_id" => workingtime_params}) do
    with {:ok, %Workingtime{} = workingtime} <- Worktime.create_workingtime(workingtime_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.workingtime_path(conn, :index, workingtime))
      |> render("show.json", workingtime: workingtime)
    end
  end

  def show(conn, %{"user_id" => user_id, "id" => workingtimeid}) do
    workingtime = Worktime.get_workingtimeshow(user_id, workingtimeid)
    render(conn, "show.json", workingtime: workingtime)
  end

  def update(conn, %{"id" => id, "workingtime" => workingtime_params}) do
    workingtime = Worktime.get_workingtime!(id)

    with {:ok, %Workingtime{} = workingtime} <- Worktime.update_workingtime(workingtime, workingtime_params) do
      render(conn, "show.json", workingtime: workingtime)
    end
  end

  def delete(conn, %{"id" => id}) do
    workingtime = Worktime.get_workingtime!(id)

    with {:ok, %Workingtime{}} <- Worktime.delete_workingtime(workingtime) do
      send_resp(conn, :no_content, "")
    end
  end
end
