defmodule PedidoPhx.PedidosProdFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PedidoPhx.PedidosProd` context.
  """

  @doc """
  Generate a pedido_prod.
  """
  def pedido_prod_fixture(attrs \\ %{}) do
    {:ok, pedido_prod} =
      attrs
      |> Enum.into(%{

      })
      |> PedidoPhx.PedidosProd.create_pedido_prod()

    pedido_prod
  end
end
