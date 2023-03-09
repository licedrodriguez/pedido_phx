defmodule PedidoPhxWeb.PedidoProdControllerTest do
  use PedidoPhxWeb.ConnCase

  import PedidoPhx.PedidosProdFixtures

  alias PedidoPhx.PedidosProd.PedidoProd

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all pedidosprod", %{conn: conn} do
      conn = get(conn, ~p"/api/pedidosprod")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create pedido_prod" do
    test "renders pedido_prod when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/pedidosprod", pedido_prod: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/pedidosprod/#{id}")

      assert %{
               "id" => ^id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/pedidosprod", pedido_prod: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update pedido_prod" do
    setup [:create_pedido_prod]

    test "renders pedido_prod when data is valid", %{conn: conn, pedido_prod: %PedidoProd{id: id} = pedido_prod} do
      conn = put(conn, ~p"/api/pedidosprod/#{pedido_prod}", pedido_prod: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/pedidosprod/#{id}")

      assert %{
               "id" => ^id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, pedido_prod: pedido_prod} do
      conn = put(conn, ~p"/api/pedidosprod/#{pedido_prod}", pedido_prod: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete pedido_prod" do
    setup [:create_pedido_prod]

    test "deletes chosen pedido_prod", %{conn: conn, pedido_prod: pedido_prod} do
      conn = delete(conn, ~p"/api/pedidosprod/#{pedido_prod}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/pedidosprod/#{pedido_prod}")
      end
    end
  end

  defp create_pedido_prod(_) do
    pedido_prod = pedido_prod_fixture()
    %{pedido_prod: pedido_prod}
  end
end
