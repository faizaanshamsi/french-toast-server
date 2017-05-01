defmodule FrenchToastServer.Web.CurrentStatusView do
  use FrenchToastServer.Web, :view
  alias FrenchToastServer.Web.CurrentStatusView

  def render("show.json", %{status: status}) do
    %{id: status.id, created_at: status.inserted_at, level: status.data_level.name, description: status.data_level.description}
  end
end
