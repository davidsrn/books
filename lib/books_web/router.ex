defmodule BooksWeb.Router do
  use BooksWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", BooksWeb do
    pipe_through :browser # Use the default browser stack

    get "/", BookController, :index
    get "/book/new", BookController, :new
    post "/book", BookController, :create
    resources "/", BookController do
      resources "/books", BookController, except: [:new, :edit]
    end
  end

  # scope "/books", BooksWeb do
  #   pipe_through :browser
  #   get "/", BookController, :index
  #   resources "/", BookController do
  #     resources "/books", BookController, except: [:new, :edit]
  #   end
  #
  # end

  # Other scopes may use custom stacks.
  # scope "/api", BooksWeb do
  #   pipe_through :api
  # end
end
