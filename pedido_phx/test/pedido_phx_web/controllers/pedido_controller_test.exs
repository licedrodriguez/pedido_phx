defmodule PedidoPhxWeb.PedidoControllerTest do
  use PedidoPhxWeb.ConnCase

  import PedidoPhx.PedidosFixtures

  alias PedidoPhx.Pedidos.Pedido

  @create_attrs %{
    descripcion: "some descripcion",
    fecha: ~D[2023-03-07],
    num_orden: "some num_orden",
    total: 42
  }
  @update_attrs %{
    descripcion: "some updated descripcion",
    fecha: ~D[2023-03-08],
    num_orden: "some updated num_orden",
    total: 43
  }
  @invalid_attrs %{descripcion: nil, fecha: nil, num_orden: nil, total: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all pedidos", %{conn: conn} do
      conn = get(conn, ~p"/api/pedidos")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create pedido" do
    test "renders pedido when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/pedidos", pedido: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/pedidos/#{id}")

      assert %{
               "id" => ^id,
               "descripcion" => "some descripcion",
               "fecha" => "2023-03-07",
               "num_orden" => "some num_orden",
               "total" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/pedidos", pedido: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update pedido" do
    setup [:create_pedido]

    test "renders pedido when data is valid", %{conn: conn, pedido: %Pedido{id: id} = pedido} do
      conn = put(conn, ~p"/api/pedidos/#{pedido}", pedido: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/pedidos/#{id}")

      assert %{
               "id" => ^id,
               "descripcion" => "some updated descripcion",
               "fecha" => "2023-03-08",
               "num_orden" => "some updated num_orden",
               "total" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, pedido: pedido} do
      conn = put(conn, ~p"/api/pedidos/#{pedido}", pedido: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete pedido" do
    setup [:create_pedido]

    test "deletes chosen pedido", %{conn: conn, pedido: pedido} do
      conn = delete(conn, ~p"/api/pedidos/#{pedido}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/pedidos/#{pedido}")
      end
    end
  end

  defp create_pedido(_) do
    pedido = pedido_fixture()
    %{pedido: pedido}
  end
end
