defmodule FrenchToastServer.Web.Router do
  use FrenchToastServer.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/v1", FrenchToastServer.Web do
    pipe_through :api

    resources "/statuses", StatusController, only: [:index, :show]
    get "/status-history", StatusController, :index
    get "/current-status", CurrentStatusController, :show
  end

  scope "/alexa", FrenchToastServer.Web do
    pipe_through :api

    post "/", AlexaController, :post
  end
end
