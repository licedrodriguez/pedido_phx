defmodule PedidoPhxWeb.ClienteJSON do
  alias PedidoPhx.Clientes.Cliente

  @doc """
  Renders a list of clientes.
  """
  def index(%{clientes: clientes}) do
    %{data: for(cliente <- clientes, do: data(cliente))}
  end

  @doc """
  Renders a single cliente.
  """
  def show(%{cliente: cliente}) do
    %{data: data(cliente)}
  end

  defp data(%Cliente{} = cliente) do
    pedidos = case is_list(cliente.pedidos) do
      false -> []
      true -> cliente.pedidos |> Enum.map(& Map.from_struct(&1))
      |> Enum.map(& Enum.reduce([:__meta__, :cliente, :cliente_id, :productos, :pedidos, :inserted_at, :updated_at], &1, fn key, acc -> Map.delete(acc, key) end))
    end

    %{
      id: cliente.id,
      identificacion: cliente.identificacion,
      nombres: cliente.nombres,
      apellidos: cliente.apellidos,
      telefono: cliente.telefono,
      direccion: cliente.direccion,
      email: cliente.email,
      pedidos: pedidos
    }
  end
end
