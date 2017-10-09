defmodule Books.Repo.Migrations.CreateBooks do
  use Ecto.Migration

  def change do
    create table(:books) do
      add :title, :string
      add :author, :string
      add :code, :integer
      add :description, :text
      add :genre, :string
      add :editorial, :string
      add :urlimg, :string
      add :urlpdf, :string

      timestamps()
    end

  end
end
