defmodule PedidoPhx.ProductosFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PedidoPhx.Productos` context.
  """

  @doc """
  Generate a producto.
  """
  def producto_fixture(attrs \\ %{}) do
    {:ok, producto} =
      attrs
      |> Enum.into(%{
        descripcion: "some descripcion",
        nombre: "some nombre",
        num_prod: "some num_prod",
        tipo: "some tipo",
        valor: 42
      })
      |> PedidoPhx.Productos.create_producto()

    producto
  end
end
