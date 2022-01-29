defmodule Exmeal.Meals.UpdateTest do
  use Exmeal.DataCase

  import Exmeal.Factory

  alias Exmeal.Meals.Meal

  describe "Update Meal" do
    test "when a valid id is given, returns the meal" do
      %{id: user_id} = build(:user)

      params = %{
        calories: 20,
        date: ~D[2001-05-02],
        description: "Banana",
        user_id: user_id
      }

      {_ok, meal} = Exmeal.create_meal(params)

      response = Exmeal.update_meal(%{"id" => meal.id, "calories" => 25})

      assert {:ok,
              %Meal{
                id: _id,
                description: "Banana",
                date: ~D[2001-05-02],
                calories: 25,
                user_id: _user_id
              }} = response
    end

    test "when an invalid id is given, returns an error" do
      id = "a6ef9b39-d638-4835-9ad7-dbe48d1257eb"
      response = Exmeal.update_meal(%{"id" => id})

      assert {:error, %Exmeal.Error{result: "Meal not found!", status: :not_found}} = response
    end
  end
end
