defmodule Exmeal.Meals.Update do
  alias Exmeal.Meals.Meal
  alias Exmeal.{Error, Repo}

  def call(%{"id" => id} = params) do
    Meal
    |> Repo.get(id)
    |> handle_update(params)
  end

  defp handle_update(nil, _params), do: {:error, Error.build_meal_not_found_error()}

  defp handle_update(meal, params), do: do_update(meal, params)

  defp do_update(%Meal{} = meal, params) do
    meal
    |> Meal.changeset(params)
    |> Repo.update()
  end
end
