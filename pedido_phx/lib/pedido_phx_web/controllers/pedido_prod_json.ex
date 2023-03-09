defmodule PedidoPhxWeb.PedidoProdJSON do
  alias PedidoPhx.PedidosProd.PedidoProd

  @doc """
  Renders a list of pedidosprod.
  """
  def index(%{pedidosprod: pedidosprod}) do
    %{data: for(pedido_prod <- pedidosprod, do: data(pedido_prod))}
  end

  @doc """
  Renders a single pedido_prod.
  """
  def show(%{pedido_prod: pedido_prod}) do
    %{data: data(pedido_prod)}
  end

  defp data(%PedidoProd{} = pedido_prod) do
    %{
      id: pedido_prod.id
    }
  end
end
