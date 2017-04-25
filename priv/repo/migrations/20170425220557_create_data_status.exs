defmodule FrenchToastServer.Repo.Migrations.CreateFrenchToastServer.Data.Status do
  use Ecto.Migration

  def change do
    create table(:data_statuses) do
      add :data_level_id, references(:data_levels, on_delete: :nothing), null: false

      timestamps()
    end

    create index(:data_statuses, [:data_level_id])
  end
end
