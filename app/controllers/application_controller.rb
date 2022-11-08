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
    book = Book.find(params[:id])
    book.to_json({include: :reviews})
  end

  post "/books" do
    book = Book.create(title: params[:title],
                       category: params[:category],
                       description: params[:description],
                       published_date: params[:published_date],
                       image_url: params[:image_url],
                       author_id: params[:author_id])

    book.to_json
  end

  patch "/books/:id" do
    book = Book.find(params[:id])
    book.update(title: params[:title],
                category: params[:category],
                description: params[:description],
                published_date: params[:published_date],
                image_url: params[:image_url],
                author_id: params[:author_id])
    book.to_json
  end

  delete "/books/:id" do
    book = Book.find(params[:id])
    book.destroy
    book.to_json
  end

  get "/reviews" do
    reviews = Review.all
    reviews.to_json(include: { user: { only: [:id, :user_name]},  book: {only: [:id, :title]}})
  end

  get "/reviews/:id" do
    review = Review.find(params[:id])
    review.to_json()
  end

  post "/reviews" do
    review = Review.create(
      comment: params[:comment],
      book_id: params[:book_id],
      user_id: params[:user_id],
      star_rating: params[:star_rating],
    )
    review.to_json(include: { user: { only: [:id, :user_name] } })
  end

  patch "/reviews/:id" do
    review = Review.find(params[:id])
    review.update(
      comment: params[:comment],
      star_rating: params[:star_rating],
    )
    review.to_json(include: { user: { only: [:id, :user_name] } })
  end

  delete "/reviews/:id" do
    review = Review.find(params[:id])
    review.destroy
    review.to_json
  end
end
