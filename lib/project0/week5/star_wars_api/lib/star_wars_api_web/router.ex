defmodule StarWarsApiWeb.Router do
  use StarWarsApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", StarWarsApiWeb do
    pipe_through :api

    get "/movies", MovieController, :index
    get "/movies/:id", MovieController, :show
    post "/movies", MovieController, :create
    put "/movies/:id", MovieController, :update
    patch "/movies/:id", MovieController, :update
    delete "/movies/:id", MovieController, :delete
  end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:star_wars_api, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      live_dashboard "/dashboard", metrics: StarWarsApiWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
