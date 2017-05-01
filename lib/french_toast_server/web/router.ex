defmodule FrenchToastServer.Web.Router do
  use FrenchToastServer.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/v1", FrenchToastServer.Web do
    pipe_through :api

    post "/alexa", AlexaController, :post

    resources "/statuses", StatusController, only: [:index, :show]
  end

  scope "/alexa", FrenchToastServer.Web do
    pipe_through :api

    post "/", AlexaController, :post
  end
end
