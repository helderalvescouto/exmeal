defmodule Exmeal.Meals.CreateTest do
  use Exmeal.DataCase

  import Exmeal.Factory

  alias Exmeal.Meals.Meal

  describe "Create Meal" do
    test "when all params are valid, returns the meal" do
      user_params = build(:user_params)

      {:ok, user} = Exmeal.create_user(user_params)

      params = %{
        description: "Batata",
        date: "2001-05-02",
        calories: "20",
        user_id: user.id
      }

      response = Exmeal.create_meal(params)

      assert {:ok,
              %Meal{
                calories: 20,
                date: ~D[2001-05-02],
                description: "Batata",
                id: _id,
                user_id: _user_id
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
