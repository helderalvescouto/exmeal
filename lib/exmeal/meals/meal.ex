defmodule Exmeal.Meals.Meal do
  use Ecto.Schema

  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_params [:description, :date, :calories]

  schema "meals" do
    field(:description, :string)
    field(:date, :date)
    field(:calories, :integer)

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    # |> validate_date(params)
  end

  # defp validate_date(changeset, %{date: date} = _params) do
  #   case Date.from_iso8601(date) do
  #     {:error, _invalid_format} -> add_error(changeset, :date, "Invalid date format!")
  #     {:ok, _date} -> changeset
  #   end
  # end
end
