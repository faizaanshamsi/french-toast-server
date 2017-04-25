defmodule FrenchToastServer.Data.Level do
  use Ecto.Schema

  alias FrenchToastServer.Data.Status

  schema "data_levels" do
    field :color, :string
    field :description, :string
    field :name, :string

    has_one :data_status, Status

    timestamps()
  end
end
