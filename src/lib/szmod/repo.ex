defmodule Szmod.Repo do
  use Ecto.Repo,
    otp_app: :szmod,
    adapter: Ecto.Adapters.Postgres
end
