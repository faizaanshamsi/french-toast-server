defmodule FrenchToastServer.Web.StatusView do
  use FrenchToastServer.Web, :view
  alias FrenchToastServer.Web.StatusView

  def render("index.json", %{statuses: statuses}) do
    %{data: render_many(statuses, StatusView, "status.json")}
  end

  def render("show.json", %{status: status}) do
    %{data: render_one(status, StatusView, "status.json")}
  end

  def render("status.json", %{status: status}) do
    %{id: status.id, created_at: status.inserted_at, level: status.data_level.name}
  end
end
