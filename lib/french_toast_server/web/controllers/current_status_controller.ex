defmodule FrenchToastServer.Web.CurrentStatusController do
  use FrenchToastServer.Web, :controller

  alias FrenchToastServer.Data

  action_fallback FrenchToastServer.Web.FallbackController

  def show(conn, _params) do
    status = Data.get_current_status
    render(conn, "show.json", status: status)
  end
end
