defmodule PedidoPhx.Pedidos do
  @moduledoc """
  The Pedidos context.
  """

  import Ecto.Query, warn: false
  alias PedidoPhx.Repo

  alias PedidoPhx.Pedidos.Pedido

  @doc """
  Returns the list of pedidos.

  ## Examples

      iex> list_pedidos()
      [%Pedido{}, ...]

  """
  def list_pedidos do
    Repo.all(Pedido) |> Repo.preload(:cliente) |> Repo.preload(:productos)
  end

  @doc """
  Gets a single pedido.

  Raises `Ecto.NoResultsError` if the Pedido does not exist.

  ## Examples

      iex> get_pedido!(123)
      %Pedido{}

      iex> get_pedido!(456)
      ** (Ecto.NoResultsError)

  """
  def get_pedido!(id), do: Repo.get!(Pedido, id) |> Repo.preload(:cliente) |> Repo.preload(:productos)

  def get_pedido_num!(num_orden), do: Repo.get_by!(Pedido, num_orden: num_orden) |> Repo.preload(:cliente) |> Repo.preload(:productos)

  @doc """
  Creates a pedido.

  ## Examples

      iex> create_pedido(%{field: value})
      {:ok, %Pedido{}}

      iex> create_pedido(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_pedido(attrs \\ %{}) do
    %Pedido{}
    |> Pedido.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a pedido.

  ## Examples

      iex> update_pedido(pedido, %{field: new_value})
      {:ok, %Pedido{}}

      iex> update_pedido(pedido, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_pedido(%Pedido{} = pedido, attrs) do
    pedido
    |> Pedido.changeset(attrs)
    |> Repo.update()
  end

  def update_total(%Pedido{} = pedido) do
    mapProd = pedido.productos
    total = Enum.reduce(mapProd, 0, fn(prod, total) -> total + prod.valor end)
    pedido_params = %{total: total}
    pedido
    |> Pedido.changeset(pedido_params)
    |> Repo.update()
  end

  @doc """
  Deletes a pedido.

  ## Examples

      iex> delete_pedido(pedido)
      {:ok, %Pedido{}}

      iex> delete_pedido(pedido)
      {:error, %Ecto.Changeset{}}

  """
  def delete_pedido(%Pedido{} = pedido) do
    Repo.delete(pedido)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking pedido changes.

  ## Examples

      iex> change_pedido(pedido)
      %Ecto.Changeset{data: %Pedido{}}

  """
  def change_pedido(%Pedido{} = pedido, attrs \\ %{}) do
    Pedido.changeset(pedido, attrs)
  end
end
