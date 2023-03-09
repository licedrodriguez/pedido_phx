defmodule PedidoPhx.Pedidos.Pedido do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "pedidos" do
    field :descripcion, :string
    field :fecha, :date
    field :num_orden, :string
    field :total, :integer
    belongs_to :cliente, PedidoPhx.Clientes.Cliente
    many_to_many :productos, PedidoPhx.Productos.Producto, join_through: "pedidosprod"
    timestamps()
  end

  @doc false
  def changeset(pedido, attrs) do
    pedido
    |> cast(attrs, [:num_orden, :descripcion, :fecha, :total, :cliente_id])
    |> validate_required([:num_orden, :descripcion, :fecha, :total])
    |> unique_constraint(:num_orden, message: "El pedido ya existe")
  end
end
