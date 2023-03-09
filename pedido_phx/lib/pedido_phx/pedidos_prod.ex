defmodule PedidoPhx.PedidosProd do
  @moduledoc """
  The PedidosProd context.
  """

  import Ecto.Query, warn: false
  alias PedidoPhx.Repo

  alias PedidoPhx.PedidosProd.PedidoProd

  @doc """
  Returns the list of pedidosprod.

  ## Examples

      iex> list_pedidosprod()
      [%PedidoProd{}, ...]

  """
  def list_pedidosprod do
    Repo.all(PedidoProd)
  end

  @doc """
  Gets a single pedido_prod.

  Raises `Ecto.NoResultsError` if the Pedido prod does not exist.

  ## Examples

      iex> get_pedido_prod!(123)
      %PedidoProd{}

      iex> get_pedido_prod!(456)
      ** (Ecto.NoResultsError)

  """
  def get_pedido_prod!(id), do: Repo.get!(PedidoProd, id)

  @doc """
  Creates a pedido_prod.

  ## Examples

      iex> create_pedido_prod(%{field: value})
      {:ok, %PedidoProd{}}

      iex> create_pedido_prod(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_pedido_prod(attrs \\ %{}) do
    %PedidoProd{}
    |> PedidoProd.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a pedido_prod.

  ## Examples

      iex> update_pedido_prod(pedido_prod, %{field: new_value})
      {:ok, %PedidoProd{}}

      iex> update_pedido_prod(pedido_prod, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_pedido_prod(%PedidoProd{} = pedido_prod, attrs) do
    pedido_prod
    |> PedidoProd.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a pedido_prod.

  ## Examples

      iex> delete_pedido_prod(pedido_prod)
      {:ok, %PedidoProd{}}

      iex> delete_pedido_prod(pedido_prod)
      {:error, %Ecto.Changeset{}}

  """
  def delete_pedido_prod(%PedidoProd{} = pedido_prod) do
    Repo.delete(pedido_prod)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking pedido_prod changes.

  ## Examples

      iex> change_pedido_prod(pedido_prod)
      %Ecto.Changeset{data: %PedidoProd{}}

  """
  def change_pedido_prod(%PedidoProd{} = pedido_prod, attrs \\ %{}) do
    PedidoProd.changeset(pedido_prod, attrs)
  end
end
