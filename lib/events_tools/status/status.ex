defmodule EventsTools.Status.Status do
  use Ecto.Schema
  import Ecto.Changeset
  alias EventsTools.Status.Status


  schema "status" do
    field :summary, :string
    field :title, :string
    many_to_many :profiles, EventsTools.Accounts.Profile, join_through: "profiles_status", on_delete: :delete_all, on_replace: :delete
    many_to_many :users, EventsTools.Accounts.User, join_through: "users_status", on_delete: :delete_all, on_replace: :delete


    timestamps()
  end

  @doc false
  def changeset(%Status{} = status, attrs) do
    status
    |> cast(attrs, [:title, :summary])
    |> validate_required([:title])
  end
end
