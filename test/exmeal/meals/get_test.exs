defmodule Exmeal.Meals.GetTest do
  use Exmeal.DataCase

  import Exmeal.Factory

  alias Exmeal.Meals.Meal

  describe "Get Meal" do
    test "when a valid id is given, returns the meal" do
      user_params = build(:user_params)

      {:ok, user} = Exmeal.create_user(user_params)

      params = %{
        calories: 20,
        date: ~D[2001-05-02],
        description: "Banana",
        user_id: user.id
      }

      {:ok, meal} = Exmeal.create_meal(params)

      response = Exmeal.get_meal_by_id(meal.id)

      user_id = user.id

      assert {:ok,
              %Meal{
                id: _id,
                description: "Banana",
                calories: 20,
                date: ~D[2001-05-02],
                user_id: ^user_id
              }} = response
    end

    test "when an invalid id is given, returns an error" do
      id = "a6ef9b39-d638-4835-9ad7-dbe48d1257eb"

      response = Exmeal.get_meal_by_id(id)

      assert {:error, %Exmeal.Error{result: "Meal not found!", status: :not_found}} = response
    end
  end
end
