#Класс содержит информацию о наборе продуктов
class ProductCollection

  #Константы с названиями соответствующих классов
  #и путями до файлов с данными каждого типа
  PRODUCT_TYPES = {
    movie: {dir: "films", class: Movie},
    book: {dir: "books", class: Book},
    disk: {dir: "disks", class: Disk}
  }

  def initialize(products = [])
    @products = products
  end

  #Создает экземпляры классов из файлов с данными
  #из соответствующих папок
  def self.from_dir(data_path)
    products = []

    PRODUCT_TYPES.each do |type, hash|
      product_dir = hash[:dir]
      product_class = hash[:class]

      Dir["#{data_path}/#{product_dir}/*.txt"].each do |file|
        products << product_class.from_file(file)
      end
    end

    #Вызываем конструктор этоже класса
    self.new(products)
  end

  def to_a
    @products
  end

  #Сортировка списка товаров
  def sort(params)
    case params[:by]
    when :title
      @products.sort{|product| product}
    when :amount
      @products.sort{|product| product.amount}
    when :price
      @products.sort{|product| product.price}
    end

  #сортируем массив по убыванию
  @product.reverse if params[:by]  == :asc

  self
  end
end
