defmodule SzmodWeb.PageController do
  use SzmodWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
