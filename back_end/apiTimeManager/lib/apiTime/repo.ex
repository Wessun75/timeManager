defmodule Todolist.Repo do
  use Ecto.Repo,
    otp_app: :apiTime,
    adapter: Ecto.Adapters.Postgres
end
