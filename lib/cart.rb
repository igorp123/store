#Класс содержит информацию о товарах в корзине
class Cart
  attr_reader :list

  def initialize
    @list = []
  end

  #добавляем товар в корзину
  def add(product)
    @list << product
    product.update(amount: product.amount - 1 )
  end

  #Сумма товаров в корзине
  def total
    @list.inject(0){|sum, product| sum + product.price}
  end
end
