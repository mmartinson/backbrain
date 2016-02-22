defmodule Backbrain.Artifact do
  use Backbrain.Web, :model

  schema "artifacts" do
    field :url, :string
    field :title, :string
    field :needs_metadata, :boolean

    timestamps
  end

  @required_fields ~w(url title)
  @optional_fields ~w(needs_metadata)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
