defmodule BooksWeb.BookView do
  use BooksWeb, :view
  alias BooksWeb.BookView

  def render("index.json", %{books: books}) do
    %{data: render_many(books, BookView, "book.json")}
  end

  def render("show.json", %{book: book}) do
    %{data: render_one(book, BookView, "book.json")}
  end

  def render("book.json", %{book: book}) do
    %{id: book.id,
      title: book.title,
      author: book.author,
      code: book.code,
      description: book.description,
      genre: book.genre,
      editorial: book.editorial,
      urlimg: book.urlimg}
  end
end
