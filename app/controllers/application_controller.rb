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
end
