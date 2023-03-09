defmodule PedidoPhxWeb.ProductoControllerTest do
  use PedidoPhxWeb.ConnCase

  import PedidoPhx.ProductosFixtures

  alias PedidoPhx.Productos.Producto

  @create_attrs %{
    descripcion: "some descripcion",
    nombre: "some nombre",
    num_prod: "some num_prod",
    tipo: "some tipo",
    valor: 42
  }
  @update_attrs %{
    descripcion: "some updated descripcion",
    nombre: "some updated nombre",
    num_prod: "some updated num_prod",
    tipo: "some updated tipo",
    valor: 43
  }
  @invalid_attrs %{descripcion: nil, nombre: nil, num_prod: nil, tipo: nil, valor: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all productos", %{conn: conn} do
      conn = get(conn, ~p"/api/productos")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create producto" do
    test "renders producto when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/productos", producto: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/productos/#{id}")

      assert %{
               "id" => ^id,
               "descripcion" => "some descripcion",
               "nombre" => "some nombre",
               "num_prod" => "some num_prod",
               "tipo" => "some tipo",
               "valor" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/productos", producto: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update producto" do
    setup [:create_producto]

    test "renders producto when data is valid", %{conn: conn, producto: %Producto{id: id} = producto} do
      conn = put(conn, ~p"/api/productos/#{producto}", producto: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/productos/#{id}")

      assert %{
               "id" => ^id,
               "descripcion" => "some updated descripcion",
               "nombre" => "some updated nombre",
               "num_prod" => "some updated num_prod",
               "tipo" => "some updated tipo",
               "valor" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, producto: producto} do
      conn = put(conn, ~p"/api/productos/#{producto}", producto: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete producto" do
    setup [:create_producto]

    test "deletes chosen producto", %{conn: conn, producto: producto} do
      conn = delete(conn, ~p"/api/productos/#{producto}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/productos/#{producto}")
      end
    end
  end

  defp create_producto(_) do
    producto = producto_fixture()
    %{producto: producto}
  end
end
