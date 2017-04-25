defmodule FrenchToastServer.Web.StatusControllerTest do
  use FrenchToastServer.Web.ConnCase

  alias FrenchToastServer.Data
  alias FrenchToastServer.Data.Status

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

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

  test "creates status and renders status when data is valid", %{conn: conn} do
    conn = post conn, status_path(conn, :create), status: @create_attrs
    assert %{"id" => id} = json_response(conn, 201)["data"]

    conn = get conn, status_path(conn, :show, id)
    assert json_response(conn, 200)["data"] == %{
      "id" => id}
  end

  test "does not create status and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, status_path(conn, :create), status: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates chosen status and renders status when data is valid", %{conn: conn} do
    %Status{id: id} = status = fixture(:status)
    conn = put conn, status_path(conn, :update, status), status: @update_attrs
    assert %{"id" => ^id} = json_response(conn, 200)["data"]

    conn = get conn, status_path(conn, :show, id)
    assert json_response(conn, 200)["data"] == %{
      "id" => id}
  end

  test "does not update chosen status and renders errors when data is invalid", %{conn: conn} do
    status = fixture(:status)
    conn = put conn, status_path(conn, :update, status), status: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen status", %{conn: conn} do
    status = fixture(:status)
    conn = delete conn, status_path(conn, :delete, status)
    assert response(conn, 204)
    assert_error_sent 404, fn ->
      get conn, status_path(conn, :show, status)
    end
  end
end
