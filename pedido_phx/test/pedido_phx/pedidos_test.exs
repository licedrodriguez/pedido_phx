defmodule PedidoPhx.PedidosTest do
  use PedidoPhx.DataCase

  alias PedidoPhx.Pedidos

  describe "pedidos" do
    alias PedidoPhx.Pedidos.Pedido

    import PedidoPhx.PedidosFixtures

    @invalid_attrs %{descripcion: nil, fecha: nil, num_orden: nil, total: nil}

    test "list_pedidos/0 returns all pedidos" do
      pedido = pedido_fixture()
      assert Pedidos.list_pedidos() == [pedido]
    end

    test "get_pedido!/1 returns the pedido with given id" do
      pedido = pedido_fixture()
      assert Pedidos.get_pedido!(pedido.id) == pedido
    end

    test "create_pedido/1 with valid data creates a pedido" do
      valid_attrs = %{descripcion: "some descripcion", fecha: ~D[2023-03-07], num_orden: "some num_orden", total: 42}

      assert {:ok, %Pedido{} = pedido} = Pedidos.create_pedido(valid_attrs)
      assert pedido.descripcion == "some descripcion"
      assert pedido.fecha == ~D[2023-03-07]
      assert pedido.num_orden == "some num_orden"
      assert pedido.total == 42
    end

    test "create_pedido/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Pedidos.create_pedido(@invalid_attrs)
    end

    test "update_pedido/2 with valid data updates the pedido" do
      pedido = pedido_fixture()
      update_attrs = %{descripcion: "some updated descripcion", fecha: ~D[2023-03-08], num_orden: "some updated num_orden", total: 43}

      assert {:ok, %Pedido{} = pedido} = Pedidos.update_pedido(pedido, update_attrs)
      assert pedido.descripcion == "some updated descripcion"
      assert pedido.fecha == ~D[2023-03-08]
      assert pedido.num_orden == "some updated num_orden"
      assert pedido.total == 43
    end

    test "update_pedido/2 with invalid data returns error changeset" do
      pedido = pedido_fixture()
      assert {:error, %Ecto.Changeset{}} = Pedidos.update_pedido(pedido, @invalid_attrs)
      assert pedido == Pedidos.get_pedido!(pedido.id)
    end

    test "delete_pedido/1 deletes the pedido" do
      pedido = pedido_fixture()
      assert {:ok, %Pedido{}} = Pedidos.delete_pedido(pedido)
      assert_raise Ecto.NoResultsError, fn -> Pedidos.get_pedido!(pedido.id) end
    end

    test "change_pedido/1 returns a pedido changeset" do
      pedido = pedido_fixture()
      assert %Ecto.Changeset{} = Pedidos.change_pedido(pedido)
    end
  end
end
