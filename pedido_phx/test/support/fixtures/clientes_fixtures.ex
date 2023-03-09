defmodule PedidoPhx.ClientesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PedidoPhx.Clientes` context.
  """

  @doc """
  Generate a cliente.
  """
  def cliente_fixture(attrs \\ %{}) do
    {:ok, cliente} =
      attrs
      |> Enum.into(%{
        apellidos: "some apellidos",
        direccion: "some direccion",
        email: "some email",
        identificacion: "some identificacion",
        nombres: "some nombres",
        telefono: "some telefono"
      })
      |> PedidoPhx.Clientes.create_cliente()

    cliente
  end
end
