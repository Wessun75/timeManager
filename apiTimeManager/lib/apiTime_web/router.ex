defmodule TodolistWeb.Router do
  use TodolistWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", TodolistWeb do
    pipe_through :api
    resources "/users", UserController, except: [:new, :edit]
    resources "/clocks", ClockController, param: "user_id", except: [:new, :edit]
    post "/clocks/:user_id", ClockController, :create
    post "/workingtimes/:user_id", WorkingtimeController, :create
    resources "/workingtimes", WorkingtimeController, only: [:update, :delete]
    resources "/workingtimes/:user_id", WorkingtimeController, only: [:index, :show] do
    end
  end

  # Enables LiveDashboard only for development"
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: TodolistWeb.Telemetry
    end
  end
end
