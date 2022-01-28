defmodule Exmeal do
  alias Exmeal.Meals.Create, as: CreateMeal
  alias Exmeal.Meals.Delete, as: DeleteMeal
  alias Exmeal.Meals.Get, as: GetMeal
  alias Exmeal.Meals.Update, as: UpdateMeal

  alias Exmeal.Users.Create, as: CreateUser

  defdelegate create_meal(params), to: CreateMeal, as: :call
  defdelegate delete_meal(params), to: DeleteMeal, as: :call
  defdelegate get_meal_by_id(params), to: GetMeal, as: :get_by_id
  defdelegate update_meal(params), to: UpdateMeal, as: :call

  defdelegate create_user(params), to: CreateUser, as: :call
end
