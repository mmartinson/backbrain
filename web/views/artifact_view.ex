defmodule Backbrain.ArtifactView do
  use Backbrain.Web, :view

  def display(artifact) do
    IO.puts inspect(artifact)
    case artifact.title do
      "" ->
        protocol_delimiter = "://"
        [protocol, url] = String.split(artifact.url, protocol_delimiter)
        url
      _ ->
        artifact.title
    end
  end

  def reverse(artifacts) do
    Enum.reverse(artifacts)
  end
end
