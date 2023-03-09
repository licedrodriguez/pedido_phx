defmodule PedidoPhx.PedidosProdTest do
  use PedidoPhx.DataCase

  alias PedidoPhx.PedidosProd

  describe "pedidosprod" do
    alias PedidoPhx.PedidosProd.PedidoProd

    import PedidoPhx.PedidosProdFixtures

    @invalid_attrs %{}

    test "list_pedidosprod/0 returns all pedidosprod" do
      pedido_prod = pedido_prod_fixture()
      assert PedidosProd.list_pedidosprod() == [pedido_prod]
    end

    test "get_pedido_prod!/1 returns the pedido_prod with given id" do
      pedido_prod = pedido_prod_fixture()
      assert PedidosProd.get_pedido_prod!(pedido_prod.id) == pedido_prod
    end

    test "create_pedido_prod/1 with valid data creates a pedido_prod" do
      valid_attrs = %{}

      assert {:ok, %PedidoProd{} = pedido_prod} = PedidosProd.create_pedido_prod(valid_attrs)
    end

    test "create_pedido_prod/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = PedidosProd.create_pedido_prod(@invalid_attrs)
    end

    test "update_pedido_prod/2 with valid data updates the pedido_prod" do
      pedido_prod = pedido_prod_fixture()
      update_attrs = %{}

      assert {:ok, %PedidoProd{} = pedido_prod} = PedidosProd.update_pedido_prod(pedido_prod, update_attrs)
    end

    test "update_pedido_prod/2 with invalid data returns error changeset" do
      pedido_prod = pedido_prod_fixture()
      assert {:error, %Ecto.Changeset{}} = PedidosProd.update_pedido_prod(pedido_prod, @invalid_attrs)
      assert pedido_prod == PedidosProd.get_pedido_prod!(pedido_prod.id)
    end

    test "delete_pedido_prod/1 deletes the pedido_prod" do
      pedido_prod = pedido_prod_fixture()
      assert {:ok, %PedidoProd{}} = PedidosProd.delete_pedido_prod(pedido_prod)
      assert_raise Ecto.NoResultsError, fn -> PedidosProd.get_pedido_prod!(pedido_prod.id) end
    end

    test "change_pedido_prod/1 returns a pedido_prod changeset" do
      pedido_prod = pedido_prod_fixture()
      assert %Ecto.Changeset{} = PedidosProd.change_pedido_prod(pedido_prod)
    end
  end
end
