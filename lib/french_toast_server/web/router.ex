defmodule FrenchToastServer.Web.Router do
  use FrenchToastServer.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", FrenchToastServer.Web do
    pipe_through :api
  end
end
