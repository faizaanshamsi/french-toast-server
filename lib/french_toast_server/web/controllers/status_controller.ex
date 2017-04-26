defmodule FrenchToastServer.Web.StatusController do
  use FrenchToastServer.Web, :controller

  alias FrenchToastServer.Data
  alias FrenchToastServer.Data.Status

  action_fallback FrenchToastServer.Web.FallbackController

  def index(conn, _params) do
    statuses = Data.list_statuses()
    render(conn, "index.json", statuses: statuses)
  end

  def create(conn, %{"status" => status_params}) do
    with {:ok, %Status{} = status} <- Data.create_status(status_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", status_path(conn, :show, status))
      |> render("show.json", status: status)
    end
  end

  def show(conn, %{"id" => id}) do
    status = Data.get_status!(id)
    render(conn, "show.json", status: status)
  end

  def update(conn, %{"id" => id, "status" => status_params}) do
    status = Data.get_status!(id)

    with {:ok, %Status{} = status} <- Data.update_status(status, status_params) do
      render(conn, "show.json", status: status)
    end
  end

  def delete(conn, %{"id" => id}) do
    status = Data.get_status!(id)
    with {:ok, %Status{}} <- Data.delete_status(status) do
      send_resp(conn, :no_content, "")
    end
  end
end
