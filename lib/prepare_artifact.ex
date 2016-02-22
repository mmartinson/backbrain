defmodule PrepareArtifact do
  import HTTPotion
  import Floki
  alias Backbrain.Artifact

  def create_changeset(url) do
    url
    |> query_url
    |> extract_metadata
    |> create_changeset(%Artifact{}, url)
  end

  defp create_changeset(metadata, schema, url) do
    data = Map.merge(metadata, %{url: url})
    Backbrain.Artifact.changeset(schema, data)
  end

  defp query_url(url) do
    HTTPotion.get(url, [follow_redirects: false])
  end

  defp extract_metadata(%{status_code: status, body: body}) when status < 400 do
    case Floki.find(body, "title") do
       [{_elem, _atts, [title]}] -> %{title: title}
      [{_elem, _atts, title}]    -> %{title: title}
       _                         -> %{title: ""}
    end
  end

  defp extract_metadata(%{}) do
    %{needs_metadata: true, title: ""}
  end
end
