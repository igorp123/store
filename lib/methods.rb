def print_collection(collection)
  collection.each_with_index do |product, index|
    puts "#{index + 1}. #{product}"
  end
end

def product_present?(product)
  product.amount > 0
end
