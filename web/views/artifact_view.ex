defmodule Backbrain.ArtifactView do
  use Backbrain.Web, :view

  def display(artifact) do
    protocol_delimiter = "://"
    [protocol, url] = String.split(artifact.url, protocol_delimiter)
    url
  end
end
