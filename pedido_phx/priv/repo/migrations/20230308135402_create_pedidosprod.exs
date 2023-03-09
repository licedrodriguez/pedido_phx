defmodule PedidoPhx.Repo.Migrations.CreatePedidosprod do
  use Ecto.Migration

  def change do
    create table(:pedidosprod, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :producto_id, references(:productos, on_delete: :nothing, type: :binary_id)
      add :pedido_id, references(:pedidos, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:pedidosprod, [:producto_id])
    create index(:pedidosprod, [:pedido_id])
    create unique_index(:pedidosprod, [:producto_id, :pedido_id])
  end
end
