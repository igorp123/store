#Родительский класс для всех продуктов
class Product
  attr_accessor :price, :amount

  def initialize(params)
    @price = params[:price]
    @amount = params[:amount]
  end

  def to_s
    "#{@price} руб. (осталось #{@amount})"
  end

  #Обновление свойств экземпляра
  def update(params)
    @price = params[:price] if params[:price]
    @amount = params[:amount] if params[:amount]
  end

  #Выводит ошибку, если экземпляры класса будут пытаться использовать метод
  #родительского класса
  def self.from_file(file_path)
    raise NotImplementedError
  end
end
