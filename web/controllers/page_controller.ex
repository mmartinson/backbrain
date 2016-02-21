defmodule Backbrain.PageController do
  use Backbrain.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
