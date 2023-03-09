defmodule PedidoPhx.Repo.Migrations.CreatePedidos do
  use Ecto.Migration

  def change do
    create table(:pedidos, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :num_orden, :string
      add :descripcion, :string
      add :fecha, :date
      add :total, :integer
      add :cliente_id, references(:clientes, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:pedidos, [:cliente_id, :num_orden])
  end
end
