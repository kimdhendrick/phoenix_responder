defmodule ResponderWeb.HelloController do
  use ResponderWeb, :controller

  def index(conn, _params) do
    render(conn, :index)
  end

  def show(conn, %{"messenger" => messenger}) do
#    render(conn, :show, messenger: messenger)
    conn
    |> assign(:messenger, messenger)
    |> assign(:receiver, "Dweezil")
    |> put_flash(:info, "Welcome to Phoenix, from flash info!")
    |> put_flash(:error, "Let's pretend we have an error.")
    |> render(:show)
  end
end
