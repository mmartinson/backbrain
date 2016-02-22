defmodule Backbrain.ArtifactController do
  require Logger
  use Backbrain.Web, :controller
  alias Backbrain.Artifact

  def index(conn, _params) do
    render conn, "index.html", artifacts: Repo.all(Artifact)
  end

  def create(conn, %{"url" => url}) do
    changeset = PrepareArtifact.create_changeset(url)

    conn
    |> report_result(Repo.insert(changeset))
    |> index(%{})
  end

  defp report_result(conn, {:ok, %{url: url}}) do
    put_flash(conn, :info, "#{url} saved")
  end

  defp report_result(conn, {:error, changeset}) do
    Logger.debug "#{inspect(changeset)}"
    put_flash(conn, :error, "Enter a URL")
  end
end
