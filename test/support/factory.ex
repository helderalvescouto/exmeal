defmodule Exmeal.Factory do
  use ExMachina.Ecto, repo: Exmeal.Repo

  alias Exmeal.{Meals.Meal, Users.User}

  def meal_params_factory do
    %{
      description: "Banana",
      date: "2001-05-02",
      calories: "20",
      user_id: "69961117-d966-4e2f-ac55-476d4f78dddf"
    }
  end

  def meal_factory do
    %Meal{
      id: "69961117-d966-4e2f-ac55-476d4f78ddfa",
      description: "banana",
      date: "2001-05-02",
      calories: "2",
      user_id: "69961117-d966-4e2f-ac55-476d4f78dddf"
    }
  end

  def user_params_factory do
    %{
      name: "Jp",
      email: "jp@banana.com",
      cpf: "12345678900"
    }
  end

  def user_factory do
    %User{
      name: "Jp",
      email: "jp@banana.com",
      cpf: "12345678900",
      id: "69961117-d966-4e2f-ac55-476d4f78dddf"
    }
  end
end
