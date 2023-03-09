defmodule PedidoPhx.PedidosProd.PedidoProd do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "pedidosprod" do
    belongs_to :producto, PedidoPhx.Productos.Producto
    belongs_to :pedido, PedidoPhx.Pedidos.Pedido

    timestamps()
  end

  @doc false
  def changeset(pedido_prod, attrs) do
    pedido_prod
    |> cast(attrs, [:producto_id, :pedido_id ])
    |> validate_required([])
  end
end
