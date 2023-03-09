defmodule PedidoPhx.Clientes.Cliente do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "clientes" do
    field :apellidos, :string
    field :direccion, :string
    field :email, :string
    field :identificacion, :string
    field :nombres, :string
    field :telefono, :string
    has_many :pedidos, PedidoPhx.Pedidos.Pedido, foreign_key: :cliente_id
    timestamps()
  end

  @doc false
  def changeset(cliente, attrs) do
    cliente
    |> cast(attrs, [:identificacion, :nombres, :apellidos, :telefono, :direccion, :email])
    |> validate_required([:identificacion, :nombres, :apellidos, :telefono, :direccion, :email])
    |> unique_constraint(:identificacion, message: "El cliente ya existe")
  end
end
