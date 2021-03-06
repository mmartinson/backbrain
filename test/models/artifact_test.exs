defmodule Backbrain.ArtifactTest do
  use Backbrain.ModelCase

  alias Backbrain.Artifact

  @valid_attrs %{url: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Artifact.changeset(%Artifact{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Artifact.changeset(%Artifact{}, @invalid_attrs)
    refute changeset.valid?
  end
end
