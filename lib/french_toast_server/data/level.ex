defmodule FrenchToastServer.Data.Level do
  use Ecto.Schema

  schema "data_levels" do
    field :color, :string
    field :description, :string
    field :name, :string

    timestamps()
  end
end
