defmodule Exmeal.Meals.CreateTest do
  use Exmeal.DataCase

  import Exmeal.Factory

  alias Exmeal.Meals.Meal
  alias Exmeal.Users.User

  describe "Create Meal" do
    test "when all params are valid, returns the meal" do
      {:ok, %{id: id}} = build(:user)

      params = %{
        description: "Batata",
        date: "2001-05-02",
        calories: "20",
        user_id: id
      }

      response = Exmeal.create_meal(params)

      IO.inspect(response, label: "RESPONSE")

      assert {:ok,
              %Meal{
                calories: 20,
                date: ~D[2001-05-02],
                description: "Banana",
                id: _id,
                user_id: id
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
