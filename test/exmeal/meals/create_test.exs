defmodule Exmeal.Meals.CreateTest do
  use Exmeal.DataCase

  alias Exmeal.Meals.Meal

  describe "Create Meal" do
    test "when all params are valid, returns the meal" do
      params = %{
        description: "Batata",
        date: "2001-05-02",
        calories: "20",
        user_id: "69961117-d966-4e2f-ac55-476d4f78dddf"
      }

      response = Exmeal.create_meal(params)

      assert {:ok,
              %Meal{
                calories: 20,
                date: ~D[2001-05-02],
                description: "Banana",
                id: _id,
                user_id: "69961117-d966-4e2f-ac55-476d4f78dddf"
              }} = response
    end

    test "when there are invalid params, returns an error" do
      params = %{
        calories: 20,
        date: ~D[2001-05-02]
      }

      response = Exmeal.create_meal(params)

      assert {:error, %Exmeal.Error{}} = response
    end
  end
end
