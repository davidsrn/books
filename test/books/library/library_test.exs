defmodule Books.LibraryTest do
  use Books.DataCase

  alias Books.Library

  describe "books" do
    alias Books.Library.Book

    @valid_attrs %{author: "some author", code: 42, description: "some description", editorial: "some editorial", genre: "some genre", title: "some title", urlimg: "some urlimg"}
    @update_attrs %{author: "some updated author", code: 43, description: "some updated description", editorial: "some updated editorial", genre: "some updated genre", title: "some updated title", urlimg: "some updated urlimg"}
    @invalid_attrs %{author: nil, code: nil, description: nil, editorial: nil, genre: nil, title: nil, urlimg: nil}

    def book_fixture(attrs \\ %{}) do
      {:ok, book} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Library.create_book()

      book
    end

    test "list_books/0 returns all books" do
      book = book_fixture()
      assert Library.list_books() == [book]
    end

    test "get_book!/1 returns the book with given id" do
      book = book_fixture()
      assert Library.get_book!(book.id) == book
    end

    test "create_book/1 with valid data creates a book" do
      assert {:ok, %Book{} = book} = Library.create_book(@valid_attrs)
      assert book.author == "some author"
      assert book.code == 42
      assert book.description == "some description"
      assert book.editorial == "some editorial"
      assert book.genre == "some genre"
      assert book.title == "some title"
      assert book.urlimg == "some urlimg"
    end

    test "create_book/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Library.create_book(@invalid_attrs)
    end

    test "update_book/2 with valid data updates the book" do
      book = book_fixture()
      assert {:ok, book} = Library.update_book(book, @update_attrs)
      assert %Book{} = book
      assert book.author == "some updated author"
      assert book.code == 43
      assert book.description == "some updated description"
      assert book.editorial == "some updated editorial"
      assert book.genre == "some updated genre"
      assert book.title == "some updated title"
      assert book.urlimg == "some updated urlimg"
    end

    test "update_book/2 with invalid data returns error changeset" do
      book = book_fixture()
      assert {:error, %Ecto.Changeset{}} = Library.update_book(book, @invalid_attrs)
      assert book == Library.get_book!(book.id)
    end

    test "delete_book/1 deletes the book" do
      book = book_fixture()
      assert {:ok, %Book{}} = Library.delete_book(book)
      assert_raise Ecto.NoResultsError, fn -> Library.get_book!(book.id) end
    end

    test "change_book/1 returns a book changeset" do
      book = book_fixture()
      assert %Ecto.Changeset{} = Library.change_book(book)
    end
  end
end
