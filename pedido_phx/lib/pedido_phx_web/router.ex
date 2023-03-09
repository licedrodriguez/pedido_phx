defmodule PedidoPhxWeb.Router do
  alias PedidoPhxWeb.ClienteController
  alias PedidoPhxWeb.ProductoController
  alias PedidoPhxWeb.PedidoController
  alias PedidoPhxWeb.PedidoProdController
  use PedidoPhxWeb, :router


  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api" do
    pipe_through :api
    resources "/clientes", ClienteController, except: [:edit, :new, :update]
    put "/clientes/id", ClienteController, :update

    resources "/productos", ProductoController, except: [:edit, :new, :update]
    put "/productos/id", ProductoController, :update

    resources "/pedidos", PedidoController, except: [:edit, :new, :update]
    put "/pedidos/id", PedidoController, :update
    put "/totalPedido/id", PedidoController, :updateTotal
    get "/pedidosnum/:num_orden", PedidoController, :showNum

    resources "/pedidosprod", PedidoProdController, except: [:edit, :new, :update]
    put "/pedidosprod/id", PedidoProdController, :update
  end
end
