#Файл с мотодами для основной программы

#Выводит все созданные экземпляры товаров
def print_collection(collection)
  collection.each_with_index do |product, index|
    puts "#{index + 1}. #{product}"
  end
end

# Возвращает есть ли товар в наличии
def product_present?(product)
  product.amount > 0
end
