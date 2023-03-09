defmodule PedidoPhx.ProductosTest do
  use PedidoPhx.DataCase

  alias PedidoPhx.Productos

  describe "productos" do
    alias PedidoPhx.Productos.Producto

    import PedidoPhx.ProductosFixtures

    @invalid_attrs %{descripcion: nil, nombre: nil, num_prod: nil, tipo: nil, valor: nil}

    test "list_productos/0 returns all productos" do
      producto = producto_fixture()
      assert Productos.list_productos() == [producto]
    end

    test "get_producto!/1 returns the producto with given id" do
      producto = producto_fixture()
      assert Productos.get_producto!(producto.id) == producto
    end

    test "create_producto/1 with valid data creates a producto" do
      valid_attrs = %{descripcion: "some descripcion", nombre: "some nombre", num_prod: "some num_prod", tipo: "some tipo", valor: 42}

      assert {:ok, %Producto{} = producto} = Productos.create_producto(valid_attrs)
      assert producto.descripcion == "some descripcion"
      assert producto.nombre == "some nombre"
      assert producto.num_prod == "some num_prod"
      assert producto.tipo == "some tipo"
      assert producto.valor == 42
    end

    test "create_producto/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Productos.create_producto(@invalid_attrs)
    end

    test "update_producto/2 with valid data updates the producto" do
      producto = producto_fixture()
      update_attrs = %{descripcion: "some updated descripcion", nombre: "some updated nombre", num_prod: "some updated num_prod", tipo: "some updated tipo", valor: 43}

      assert {:ok, %Producto{} = producto} = Productos.update_producto(producto, update_attrs)
      assert producto.descripcion == "some updated descripcion"
      assert producto.nombre == "some updated nombre"
      assert producto.num_prod == "some updated num_prod"
      assert producto.tipo == "some updated tipo"
      assert producto.valor == 43
    end

    test "update_producto/2 with invalid data returns error changeset" do
      producto = producto_fixture()
      assert {:error, %Ecto.Changeset{}} = Productos.update_producto(producto, @invalid_attrs)
      assert producto == Productos.get_producto!(producto.id)
    end

    test "delete_producto/1 deletes the producto" do
      producto = producto_fixture()
      assert {:ok, %Producto{}} = Productos.delete_producto(producto)
      assert_raise Ecto.NoResultsError, fn -> Productos.get_producto!(producto.id) end
    end

    test "change_producto/1 returns a producto changeset" do
      producto = producto_fixture()
      assert %Ecto.Changeset{} = Productos.change_producto(producto)
    end
  end
end
