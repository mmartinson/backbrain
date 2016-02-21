defmodule Backbrain.ArtifactController do
  use Backbrain.Web, :controller

  def index(conn, _params) do
    render conn, "index.html", artifacts: fake_artifacts
  end

  def create(conn, %{"url" => url}) do
    conn
    |> put_flash(:info, "#{url} saved")
    |> index(%{})
  end

  def fake_artifacts do
    [
      %{url: "http://google.com"},
      %{url: "http://hackernews.com"}
    ]
  end
end
