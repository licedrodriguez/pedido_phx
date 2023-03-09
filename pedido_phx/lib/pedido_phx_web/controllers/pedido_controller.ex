defmodule PedidoPhxWeb.PedidoController do
  use PedidoPhxWeb, :controller

  alias PedidoPhx.Pedidos
  alias PedidoPhx.Pedidos.Pedido

  action_fallback PedidoPhxWeb.FallbackController

  def index(conn, _params) do
    pedidos = Pedidos.list_pedidos()
    render(conn, :index, pedidos: pedidos)
  end

  def create(conn, %{"pedido" => pedido_params}) do
    with {:ok, %Pedido{} = pedido} <- Pedidos.create_pedido(pedido_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/pedidos/#{pedido}")
      |> render(:show, pedido: pedido)
    end
  end

  def show(conn, %{"id" => id}) do
    pedido = Pedidos.get_pedido!(id)
    render(conn, :show, pedido: pedido)
  end

  def showNum(conn, %{"num_orden" => num_orden}) do
    num_orden |> IO.inspect
    pedido = Pedidos.get_pedido_num!(num_orden)
    render(conn, :show, pedido: pedido)
  end

  def update(conn, %{"id" => id, "pedido" => pedido_params}) do
    pedido = Pedidos.get_pedido!(id)
    pedido_params |> IO.inspect

    with {:ok, %Pedido{} = pedido} <- Pedidos.update_pedido(pedido, pedido_params) do
      render(conn, :show, pedido: pedido)
    end
  end

  def updateTotal(conn, %{"id" => id}) do
    pedido = Pedidos.get_pedido!(id)
    mapProd = pedido.productos
    total = Enum.reduce(mapProd, 0, fn(prod, total) -> total + prod.valor end)
    pedido_params = %{total: total}
    with {:ok, %Pedido{} = pedido} <- Pedidos.update_pedido(pedido, pedido_params) do
       render(conn, :show, pedido: pedido)
    end
   end

  def delete(conn, %{"id" => id}) do
    pedido = Pedidos.get_pedido!(id)

    with {:ok, %Pedido{}} <- Pedidos.delete_pedido(pedido) do
      send_resp(conn, :no_content, "")
    end
  end
end
