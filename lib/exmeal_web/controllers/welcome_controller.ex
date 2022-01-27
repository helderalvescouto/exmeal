defmodule ExmealWeb.WelcomeController do
  use ExmealWeb, :controller

  def index(conn, _params) do
    conn
    |> put_status(:ok)
    |> text("Welcome!")
  end
end
