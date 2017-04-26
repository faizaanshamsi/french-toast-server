defmodule FrenchToastServer.Repo.Migrations.CreateFrenchToastServer.Data.Level do
  use Ecto.Migration

  def change do
    create table(:data_levels) do
      add :name, :string, null: false
      add :description, :text, null: false
      add :color, :string, null: false

      timestamps()
    end

    create unique_index(:data_levels, [:name])
    create unique_index(:data_levels, [:color])
  end
end
