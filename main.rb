if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require_relative 'lib/product'
require_relative 'lib/book'
require_relative 'lib/movie'
require_relative 'lib/disk'
require_relative 'lib/cart'
require_relative 'lib/product_collection'
require_relative 'lib/methods'

#Создаем корзину
cart = Cart.new

#Получаем коллекцию всех товаров в магазине из тексотвых файлов в папке data
collection = ProductCollection.from_dir("#{File.dirname(__FILE__)}/data").to_a

user_choice = nil

#Выбираем, что купить
while user_choice != 0
  puts
  puts "Что хотите купить:"
  puts

  #Выводим все товары
  print_collection(collection)

  puts "0. Выход"
  puts

  user_choice = STDIN.gets.to_i

  #Выход из цикла
  break if user_choice == 0

  chosen_product = collection[user_choice - 1]

  #Если товар есть в наличии, добавляем его во корзину
  if product_present?(chosen_product)
    cart.add(chosen_product)

    puts "Вы выбрали: #{chosen_product}"
    puts
    puts "Всего товаров на сумму: #{cart.total} руб."
  else
    puts "К сожалению, данный товар закончился!"
  end
end

#Итоговый список покупок
total_list = cart.list

#Выводим итоговый непустой список покупок
unless total_list.empty?
  puts "Вы купили:"
  puts
  puts total_list
  puts
  puts "С Вас - #{cart.total} руб. Спасибо за покупки!"
else
  puts "Сожалеем, но вы ничего не купили, возвращайтесь в другой раз..."
end
