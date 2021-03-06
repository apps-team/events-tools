defmodule EventsTools.Presentations.Presentation do
  use Ecto.Schema
  use Arc.Ecto.Schema
  import Ecto.Changeset
  alias EventsTools.Presentations.Presentation
  alias EventsTools.Slugs

  @derive {Phoenix.Param, key: :slug}
  schema "presentations" do
    field :slides, :string
    field :slides_embed, :string
    field :slides_file, EventsTools.Slides.Type
    field :slides_link, :string
    field :slug, Slugs.Type
    field :summary, :string
    field :title, :string
    many_to_many :owners, EventsTools.Accounts.User, join_through: "presentations_owners", on_delete: :delete_all, on_replace: :delete
    many_to_many :presenters, EventsTools.Accounts.Profile, join_through: "presentations_presenters", on_delete: :delete_all, on_replace: :delete
    many_to_many :events, EventsTools.Events.Event, join_through: "presentations_events", on_delete: :delete_all, on_replace: :delete
    #many_to_many :tags, EventsTools.Tags.Tag, join_through: "presentations_tags", on_delete: :delete_all, on_replace: :delete



    timestamps()
  end

  @doc false
  def changeset(%Presentation{} = presentation, attrs) do
    presentation
    |> cast(attrs, [:title, :summary, :slides_embed, :slides_file, :slides_link, :slug])
    |> validate_required([:title])
    |> Slugs.maybe_generate_slug
    #|> Slugs.unique_constraints
  end
end
