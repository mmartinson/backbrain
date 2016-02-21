ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Backbrain.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Backbrain.Repo --quiet)
Ecto.Adapters.SQL.Sandbox.mode(Demo.Repo, :manual)

