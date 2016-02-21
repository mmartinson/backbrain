defmodule Backbrain.Repo.Migrations.CreateArtifact do
  use Ecto.Migration

  def change do
    create table(:artifacts) do
      add :url, :string

      timestamps
    end

  end
end
