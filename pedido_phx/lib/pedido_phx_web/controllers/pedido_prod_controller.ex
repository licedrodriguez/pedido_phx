defmodule PedidoPhxWeb.PedidoProdController do
  use PedidoPhxWeb, :controller

  alias PedidoPhx.PedidosProd
  alias PedidoPhx.PedidosProd.PedidoProd

  action_fallback PedidoPhxWeb.FallbackController

  def index(conn, _params) do
    pedidosprod = PedidosProd.list_pedidosprod()
    render(conn, :index, pedidosprod: pedidosprod)
  end

  def create(conn, %{"pedido_prod" => pedido_prod_params}) do
    with {:ok, %PedidoProd{} = pedido_prod} <- PedidosProd.create_pedido_prod(pedido_prod_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/pedidosprod/#{pedido_prod}")
      |> render(:show, pedido_prod: pedido_prod)
    end
  end

  def show(conn, %{"id" => id}) do
    pedido_prod = PedidosProd.get_pedido_prod!(id)
    render(conn, :show, pedido_prod: pedido_prod)
  end

  def update(conn, %{"id" => id, "pedido_prod" => pedido_prod_params}) do
    pedido_prod = PedidosProd.get_pedido_prod!(id)

    with {:ok, %PedidoProd{} = pedido_prod} <- PedidosProd.update_pedido_prod(pedido_prod, pedido_prod_params) do
      render(conn, :show, pedido_prod: pedido_prod)
    end
  end

  def delete(conn, %{"id" => id}) do
    pedido_prod = PedidosProd.get_pedido_prod!(id)

    with {:ok, %PedidoProd{}} <- PedidosProd.delete_pedido_prod(pedido_prod) do
      send_resp(conn, :no_content, "")
    end
  end
end
