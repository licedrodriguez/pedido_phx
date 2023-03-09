defmodule PedidoPhxWeb.PedidoJSON do
  alias PedidoPhx.Pedidos.Pedido

  @doc """
  Renders a list of pedidos.
  """
  def index(%{pedidos: pedidos}) do
    %{data: for(pedido <- pedidos, do: data(pedido))}
  end

  @doc """
  Renders a single pedido.
  """
  def show(%{pedido: pedido}) do
    %{data: data(pedido)}
  end

  defp data(%Pedido{} = pedido) do
    pedido |> IO.inspect
    cliente = [pedido.cliente] |> Enum.map(& Map.from_struct(&1))
    |> Enum.map(& Enum.reduce([:__meta__, :cliente_id, :cliente, :pedidos, :inserted_at, :updated_at], &1, fn key, acc -> Map.delete(acc, key) end))
    |> List.first

    productos = case is_list(pedido.productos) do
      false -> []
      true -> pedido.productos |> Enum.map(& Map.from_struct(&1))
      |> Enum.map(& Enum.reduce([:__meta__, :pedidos, :inserted_at, :updated_at], &1, fn key, acc -> Map.delete(acc, key) end))
    end

    %{
      id: pedido.id,
      num_orden: pedido.num_orden,
      descripcion: pedido.descripcion,
      fecha: pedido.fecha,
      total: pedido.total,
      cliente: cliente,
      productos: productos
    }
  end
end
