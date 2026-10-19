require "test_helper"

class ProductTest < ActiveSupport::TestCase
  test "product requires a title" do
    product = Product.new(
      description: "Test product",
      price: 10.99,
      stock_quantity: 5
    )

    assert_not product.valid?
    assert_includes product.errors[:title], "can't be blank"
  end
  test "product requires a price" do
    product = Product.new(
      title: "Test Product",
      description: "Test description",
      stock_quantity: 5
    )

    assert_not product.valid?
    assert_includes product.errors[:price], "can't be blank"
  end

  test "product requires stock quantity" do
    product = Product.new(
      title: "Test Product",
      description: "Test description",
      price: 10.99
    )

    assert_not product.valid?
    assert_includes product.errors[:stock_quantity], "can't be blank"
  end
end
