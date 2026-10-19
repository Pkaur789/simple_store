
require "csv"

# Delete existing products and categories
Product.destroy_all
Category.destroy_all

# Read the CSV file
csv_file = Rails.root.join("db/products.csv")
csv_data = File.read(csv_file)
products = CSV.parse(csv_data, headers: true)

# Create products and their categories
products.each do |product|
  category_name = product["category"]

  category = Category.find_or_create_by!(name: category_name)

 Product.create!(
  title: product["name"],
  price: product["price"],
  description: product["description"],
  stock_quantity: product["stock quantity"],
  category: category
)
end

puts "Created #{Product.count} products."
puts "Created #{Category.count} categories."
