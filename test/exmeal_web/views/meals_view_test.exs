defmodule ExmealWeb.MealsViewTest do
  use ExmealWeb.ConnCase, async: true

  import Phoenix.View

  alias Exmeal.Meals.Meal

  alias ExmealWeb.MealsView

  test "render create.json" do
    params = %{description: "Banana", date: "2001-05-02", calories: "20"}
    {_ok, meal} = Exmeal.create_meal(params)

    response = render(MealsView, "create.json", meal: meal)

    assert %{
             meal: %Meal{
               calories: 20,
               date: ~D[2001-05-02],
               description: "Banana",
               id: _id
             },
             message: "Meal created!"
           } = response
  end

  test "render meal.json" do
    params = %{description: "Banana", date: "2001-05-02", calories: "20", user_id: "69961117-d966-4e2f-ac55-476d4f78dddf"}
    {_ok, meal} = Exmeal.create_meal(params)

    response = render(MealsView, "meal.json", meal: meal)

    assert %{
             meal: %Meal{
               calories: 20,
               date: ~D[2001-05-02],
               description: "Banana",
               id: _id,
               user_id: "69961117-d966-4e2f-ac55-476d4f78dddf"
             }
           } = response
  end
end
