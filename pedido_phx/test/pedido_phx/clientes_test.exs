defmodule PedidoPhx.ClientesTest do
  use PedidoPhx.DataCase

  alias PedidoPhx.Clientes

  describe "clientes" do
    alias PedidoPhx.Clientes.Cliente

    import PedidoPhx.ClientesFixtures

    @invalid_attrs %{apellidos: nil, direccion: nil, email: nil, identificacion: nil, nombres: nil, telefono: nil}

    test "list_clientes/0 returns all clientes" do
      cliente = cliente_fixture()
      assert Clientes.list_clientes() == [cliente]
    end

    test "get_cliente!/1 returns the cliente with given id" do
      cliente = cliente_fixture()
      assert Clientes.get_cliente!(cliente.id) == cliente
    end

    test "create_cliente/1 with valid data creates a cliente" do
      valid_attrs = %{apellidos: "some apellidos", direccion: "some direccion", email: "some email", identificacion: "some identificacion", nombres: "some nombres", telefono: "some telefono"}

      assert {:ok, %Cliente{} = cliente} = Clientes.create_cliente(valid_attrs)
      assert cliente.apellidos == "some apellidos"
      assert cliente.direccion == "some direccion"
      assert cliente.email == "some email"
      assert cliente.identificacion == "some identificacion"
      assert cliente.nombres == "some nombres"
      assert cliente.telefono == "some telefono"
    end

    test "create_cliente/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Clientes.create_cliente(@invalid_attrs)
    end

    test "update_cliente/2 with valid data updates the cliente" do
      cliente = cliente_fixture()
      update_attrs = %{apellidos: "some updated apellidos", direccion: "some updated direccion", email: "some updated email", identificacion: "some updated identificacion", nombres: "some updated nombres", telefono: "some updated telefono"}

      assert {:ok, %Cliente{} = cliente} = Clientes.update_cliente(cliente, update_attrs)
      assert cliente.apellidos == "some updated apellidos"
      assert cliente.direccion == "some updated direccion"
      assert cliente.email == "some updated email"
      assert cliente.identificacion == "some updated identificacion"
      assert cliente.nombres == "some updated nombres"
      assert cliente.telefono == "some updated telefono"
    end

    test "update_cliente/2 with invalid data returns error changeset" do
      cliente = cliente_fixture()
      assert {:error, %Ecto.Changeset{}} = Clientes.update_cliente(cliente, @invalid_attrs)
      assert cliente == Clientes.get_cliente!(cliente.id)
    end

    test "delete_cliente/1 deletes the cliente" do
      cliente = cliente_fixture()
      assert {:ok, %Cliente{}} = Clientes.delete_cliente(cliente)
      assert_raise Ecto.NoResultsError, fn -> Clientes.get_cliente!(cliente.id) end
    end

    test "change_cliente/1 returns a cliente changeset" do
      cliente = cliente_fixture()
      assert %Ecto.Changeset{} = Clientes.change_cliente(cliente)
    end
  end
end
