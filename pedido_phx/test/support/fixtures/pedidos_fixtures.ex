defmodule PedidoPhx.PedidosFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PedidoPhx.Pedidos` context.
  """

  @doc """
  Generate a pedido.
  """
  def pedido_fixture(attrs \\ %{}) do
    {:ok, pedido} =
      attrs
      |> Enum.into(%{
        descripcion: "some descripcion",
        fecha: ~D[2023-03-07],
        num_orden: "some num_orden",
        total: 42
      })
      |> PedidoPhx.Pedidos.create_pedido()

    pedido
  end
end
