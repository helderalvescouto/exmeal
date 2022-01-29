defmodule ExmealWeb.MealsViewTest do
  use ExmealWeb.ConnCase, async: true

  import Phoenix.View
  import Exmeal.Factory

  alias Exmeal.Meals.Meal

  alias ExmealWeb.MealsView

  test "render create.json" do
    user_params = build(:user_params)

    {:ok, user} = Exmeal.create_user(user_params)

    params = %{description: "Banana", date: "2001-05-02", calories: "20", user_id: user.id}

    {_ok, meal} = Exmeal.create_meal(params)

    response = render(MealsView, "create.json", meal: meal)

    assert %{
             meal: %Meal{
               id: _id,
               calories: 20,
               date: ~D[2001-05-02],
               description: "Banana",
               user_id: _user_id
             },
             message: "Meal created!"
           } = response
  end

  test "render meal.json" do
    user_params = build(:user_params)

    {:ok, user} = Exmeal.create_user(user_params)

    params = %{
      description: "Banana",
      date: "2001-05-02",
      calories: "20",
      user_id: user.id
    }

    {_ok, meal} = Exmeal.create_meal(params)

    response = render(MealsView, "meal.json", meal: meal)

    user_id = user.id

    assert %{
             meal: %Meal{
               calories: 20,
               date: ~D[2001-05-02],
               description: "Banana",
               id: _id,
               user_id: ^user_id
             }
           } = response
  end
end
