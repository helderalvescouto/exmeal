defmodule Exmeal.Meals.Get do
  alias Exmeal.Meals.Meal
  # alias Ecto.UUID
  alias Exmeal.{Error, Repo}

  def get_by_id(id) do
    Meal
    |> Repo.get(id)
    |> handle_get()
  end

  defp handle_get(nil), do: {:error, Error.build_meal_not_found_error()}

  defp handle_get(meal), do: {:ok, meal}
end
