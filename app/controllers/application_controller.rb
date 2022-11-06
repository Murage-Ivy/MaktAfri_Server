class ApplicationController < Sinatra::Base
  set :default_content_type, "application/json"

  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

  # Gets all books from the database
  get "/books" do
    books = Book.all
    books.to_json({ include: :author })
  end

  get "/books/:id" do
  end

  post "/books" do
  end

  patch "/books/:id" do
  end

  delete "/books/:id" do
  end

  get "/reviews" do
  end

  get "/reviews/:id" do
  end

  post "/reviews" do
  end

  patch "/reviews/:id" do
  end

  delete "/reviews/:id" do
  end
end
