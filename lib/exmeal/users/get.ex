defmodule Exmeal.Users.Get do
  alias Exmeal.Users.User

  alias Exmeal.{Error, Repo}

  def get_by_id(id) do
    User
    |> Repo.get(id)
    |> handle_get()
  end

  defp handle_get(nil), do: {:error, Error.build_user_not_found_error()}

  defp handle_get(user), do: {:ok, user}
end
