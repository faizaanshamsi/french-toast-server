defmodule FrenchToastServer.Data.Status do
  use Ecto.Schema

  schema "data_statuses" do
    belongs_to :data_level, FrenchToastServer.Data.Level

    timestamps()
  end
end
