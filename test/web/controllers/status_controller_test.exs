defmodule FrenchToastServer.Web.StatusControllerTest do
  use FrenchToastServer.Web.ConnCase

  alias FrenchToastServer.Data
  alias FrenchToastServer.Data.Status

  @create_attrs %{}

  def fixture(:status) do
    {:ok, status} = Data.create_status(@create_attrs)
    status
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, status_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end
end
