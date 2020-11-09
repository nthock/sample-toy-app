defmodule ApiWeb.PagesController do
  use ApiWeb, :controller

  @doc """
  Controller for the home page
  """
  @spec home(Plug.Conn.t(), params :: map) :: Plug.Conn.t()
  def home(conn, _params) do
    json(conn, %{message: "is working", version: "0.0.1"})
  end
end
