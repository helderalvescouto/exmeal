defmodule Exmeal.Meals.DeleteTest do
  use Exmeal.DataCase

  alias Exmeal.Meals.Meal

  describe "Delete Meal" do
    test "when a valid id is given, returns the meal" do
      params = %{
        calories: 20,
        date: ~D[2001-05-02],
        description: "Banana",
        user_id: "69961117-d966-4e2f-ac55-476d4f78dddf"
      }

      {_ok, meal} = Exmeal.create_meal(params)

      response = Exmeal.delete_meal(meal.id)

      assert {:ok,
              %Meal{
                calories: 20,
                date: ~D[2001-05-02],
                description: "Banana",
                id: _id,
                user_id: "69961117-d966-4e2f-ac55-476d4f78dddf"
              }} = response
    end

    test "when an invalid id is given, returns an error" do
      id = "a6ef9b39-d638-4835-9ad7-dbe48d1257eb"
      response = Exmeal.delete_meal(id)

      assert {:error, %Exmeal.Error{result: "Meal not found!", status: :not_found}} = response
    end
  end
end
