defmodule PedidoPhxWeb.ProductoJSON do
  alias PedidoPhx.Productos.Producto

  @doc """
  Renders a list of productos.
  """
  def index(%{productos: productos}) do
    %{data: for(producto <- productos, do: data(producto))}
  end

  @doc """
  Renders a single producto.
  """
  def show(%{producto: producto}) do
    %{data: data(producto)}
  end

  defp data(%Producto{} = producto) do
    pedidos = case is_list(producto.pedidos) do
      false -> []
      true -> producto.pedidos |> Enum.map(& Map.from_struct(&1))
      |> Enum.map(& Enum.reduce([:__meta__, :cliente, :cliente_id, :productos, :total, :inserted_at, :updated_at], &1, fn key, acc -> Map.delete(acc, key) end))
    end

    %{
      id: producto.id,
      num_prod: producto.num_prod,
      nombre: producto.nombre,
      tipo: producto.tipo,
      valor: producto.valor,
      descripcion: producto.descripcion,
      pedidos: pedidos
    }
  end
end
