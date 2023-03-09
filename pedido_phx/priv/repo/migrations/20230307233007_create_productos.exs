defmodule PedidoPhx.Repo.Migrations.CreateProductos do
  use Ecto.Migration

  def change do
    create table(:productos, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :num_prod, :string
      add :nombre, :string
      add :tipo, :string
      add :valor, :integer
      add :descripcion, :string

      timestamps()
    end

    create unique_index(:productos, [:num_prod])
  end
end
