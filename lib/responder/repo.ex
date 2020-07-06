defmodule Responder.Repo do
  use Ecto.Repo,
    otp_app: :responder,
    adapter: Ecto.Adapters.Postgres
end
