defmodule Backbrain.Router do
  use Backbrain.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Backbrain do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    # get "/artifacts", ArtifactController, :index
    # post "/artifacts", ArtifactController, :create
    resources "/artifacts", ArtifactController, only: [:index, :create]
  end

  # Other scopes may use custom stacks.
  # scope "/api", Backbrain do
  #   pipe_through :api
  # end
end
