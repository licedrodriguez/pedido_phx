defmodule PedidoPhx.Repo.Migrations.CreateClientes do
  use Ecto.Migration

  def change do
    create table(:clientes, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :identificacion, :string
      add :nombres, :string
      add :apellidos, :string
      add :telefono, :string
      add :direccion, :string
      add :email, :string

      timestamps()
    end

    create unique_index(:clientes, [:identificacion])
  end
end
