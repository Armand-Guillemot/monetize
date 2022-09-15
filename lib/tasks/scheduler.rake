task gather_product_data: :environment do
  Product.get_and_populate_data
end
