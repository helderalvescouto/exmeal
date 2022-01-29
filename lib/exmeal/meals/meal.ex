defmodule Exmeal.Meals.Meal do
  use Ecto.Schema

  import Ecto.Changeset

  alias Exmeal.Users.User

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @required_params [:description, :date, :calories, :user_id]

  @derive {Jason.Encoder, only: [:id, :description, :date, :calories, :user_id]}

  schema "meals" do
    field(:description, :string)
    field(:date, :date)
    field(:calories, :integer)

    belongs_to(:user, User)

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> foreign_key_constraint(:user_id, message: "User doesn't exist")
  end
end
