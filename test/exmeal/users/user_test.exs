defmodule Exmeal.Users.UserTest do
  use Exmeal.DataCase

  import Exmeal.Factory

  alias Ecto.Changeset

  alias Exmeal.Users.User

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = build(:user_params)

      response = User.changeset(params)

      assert %Changeset{
               changes: %{
                 cpf: "12345678900",
                 name: "Jp",
                 email: "jp@banana.com"
               },
               valid?: true
             } = response
    end
  end
end
