puts "🌱 Seeding spices..."
Book.destroy_all
Author.destroy_all
# Seed your database here

# Create random record names for author
10.times do
  Author.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
  )
end

# Create random names for users

# Creae book records
50.times do
  author = Author.order("RANDOM()").first
  Book.create(

    title: Faker::Book.title,
    category: Faker::Book.genre,
    description: Faker::Lorem.paragraph,
    published_date: Faker::Date.between_except(from: 1.year.ago, to: 1.year.from_now, excepted: Date.today),
    image_url: Faker::Avatar.image,
    author_id: author.id,
    # Add 5 reviews for each book
  )
end

#

puts "✅ Done seeding!"
