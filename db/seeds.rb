puts "🌱 Seeding..."
Book.destroy_all
Author.destroy_all
Review.destroy_all
# Seed your database here
book_images = ["https://brittlepaper.com/wp-content/uploads/2022/06/mary-alice-A-Coastline-Is-an-Immeasurable-Thing-scaled.jpeg",
               "https://brittlepaper.com/wp-content/uploads/2022/06/glory-bulawayo.jpeg",
               "https://brittlepaper.com/wp-content/uploads/2022/06/bitter-akwaeke-emezi.jpeg",
               "https://brittlepaper.com/wp-content/uploads/2022/06/one-for-sorrow-two-for-joy-9780861542338_hr.jpeg",
               "https://brittlepaper.com/wp-content/uploads/2022/06/vagabond-osunde.jpeg",
               "https://brittlepaper.com/wp-content/uploads/2022/06/patience-is-a-subtle-thief.jpeg",
               "https://brittlepaper.com/wp-content/uploads/2022/06/nikki-may-wahala-2.jpeg",
               "https://brittlepaper.com/wp-content/uploads/2022/06/scent-of-burnt-flowers.jpeg",
               "https://brittlepaper.com/wp-content/uploads/2021/12/Untitled-design-2.jpg",
               "https://brittlepaper.com/wp-content/uploads/2022/06/the-beautiful-side-of-the-moon.jpeg"]

# Create random record names for author
10.times do
  
  Author.create(
    name: Faker::Name.name,
  )
end

# Create random names for users
15.times do
  User.create(
    user_name: Faker::Name.unique.name,
    email: Faker::Internet.email,
  )
end

# Creae book records
10.times do |i|
  author = Author.order("RANDOM()").first
  book = Book.create(

    title: Faker::Book.title,
    category: Faker::Book.genre,
    description: Faker::Lorem.paragraph(sentence_count: 50),
    published_date: Faker::Date.between_except(from: 1.year.ago, to: 1.year.from_now, excepted: Date.today),
    image_url: book_images[i],
    author_id: author.id,
  )
  # Add 5 reviews for each book
  5.times do
    user_id = User.order("RANDOM()").first.id
    book.reviews << Review.create(
      comment: Faker::Lorem.paragraph,
      star_rating: rand(1...5),
      user_id: user_id,
    )
  end
end

#

puts "✅ Done seeding!"
