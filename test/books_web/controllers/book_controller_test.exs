defmodule BooksWeb.BookControllerTest do
  use BooksWeb.ConnCase

  alias Books.Library

  @create_attrs %{author: "some author", code: 42, description: "some description", editorial: "some editorial", genre: "some genre", title: "some title", urlimg: "some urlimg", urlpdf: "some urlpdf"}
  @update_attrs %{author: "some updated author", code: 43, description: "some updated description", editorial: "some updated editorial", genre: "some updated genre", title: "some updated title", urlimg: "some updated urlimg", urlpdf: "some updated urlpdf"}
  @invalid_attrs %{author: nil, code: nil, description: nil, editorial: nil, genre: nil, title: nil, urlimg: nil, urlpdf: nil}

  def fixture(:book) do
    {:ok, book} = Library.create_book(@create_attrs)
    book
  end

  describe "index" do
    test "lists all books", %{conn: conn} do
      conn = get conn, book_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Books"
    end
  end

  describe "new book" do
    test "renders form", %{conn: conn} do
      conn = get conn, book_path(conn, :new)
      assert html_response(conn, 200) =~ "New Book"
    end
  end

  describe "create book" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, book_path(conn, :create), book: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == book_path(conn, :show, id)

      conn = get conn, book_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Book"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, book_path(conn, :create), book: @invalid_attrs
      assert html_response(conn, 200) =~ "New Book"
    end
  end

  describe "edit book" do
    setup [:create_book]

    test "renders form for editing chosen book", %{conn: conn, book: book} do
      conn = get conn, book_path(conn, :edit, book)
      assert html_response(conn, 200) =~ "Edit Book"
    end
  end

  describe "update book" do
    setup [:create_book]

    test "redirects when data is valid", %{conn: conn, book: book} do
      conn = put conn, book_path(conn, :update, book), book: @update_attrs
      assert redirected_to(conn) == book_path(conn, :show, book)

      conn = get conn, book_path(conn, :show, book)
      assert html_response(conn, 200) =~ "some updated author"
    end

    test "renders errors when data is invalid", %{conn: conn, book: book} do
      conn = put conn, book_path(conn, :update, book), book: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Book"
    end
  end

  describe "delete book" do
    setup [:create_book]

    test "deletes chosen book", %{conn: conn, book: book} do
      conn = delete conn, book_path(conn, :delete, book)
      assert redirected_to(conn) == book_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, book_path(conn, :show, book)
      end
    end
  end

  defp create_book(_) do
    book = fixture(:book)
    {:ok, book: book}
  end
end
