defmodule Backbrain.Repo.Migrations.AddAttrsToArtifact do
  use Ecto.Migration

  def change do
    alter table(:artifacts) do
      add :title, :string
      add :needs_metadata, :boolean
    end
  end
end
