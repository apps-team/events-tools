defmodule EventsTools.Repo.Migrations.CreateEventsTools.Posts.Post do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string
      add :body, :text
      add :date, :date

      timestamps()
    end

  end
end
