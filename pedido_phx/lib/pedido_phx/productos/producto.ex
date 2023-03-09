defmodule PedidoPhx.Productos.Producto do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "productos" do
    field :descripcion, :string
    field :nombre, :string
    field :num_prod, :string
    field :tipo, :string
    field :valor, :integer
    many_to_many :pedidos, PedidoPhx.Pedidos.Pedido, join_through: "pedidosprod"
    timestamps()
  end

  @doc false
  def changeset(producto, attrs) do
    producto
    |> cast(attrs, [:num_prod, :nombre, :tipo, :valor, :descripcion])
    |> validate_required([:num_prod, :nombre, :tipo, :valor, :descripcion])
  end
end
