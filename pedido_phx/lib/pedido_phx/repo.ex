defmodule PedidoPhx.Repo do
  use Ecto.Repo,
    otp_app: :pedido_phx,
    adapter: Ecto.Adapters.Postgres
end
