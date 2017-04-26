defmodule FrenchToastServer.Web.Router do
  use FrenchToastServer.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/v1", FrenchToastServer.Web do
    pipe_through :api

    resources "/statuses", StatusController, only: [:index, :show]
  end
end
