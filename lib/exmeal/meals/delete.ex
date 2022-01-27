defmodule Exmeal.Meals.Delete do
  alias Exmeal.Meals.Meal
  alias Exmeal.{Error, Repo}

  def call(id) do
    Meal
    |> Repo.get(id)
    |> handle_delete()
  end

  defp handle_delete(nil), do: {:error, Error.build_meal_not_found_error()}

  defp handle_delete(meal), do: Repo.delete(meal)
end
