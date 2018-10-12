#Класс содержит информацию о книгах
class Book < Product
  attr_accessor :title, :genre, :author

  def initialize(params)
    super

    @title = params[:title]
    @genre = params[:genre]
    @author = params[:author]
  end

  def to_s
    "Книга \"#{@title}\", #{@genre}, автор - #{@author}, #{super}"
  end

  #Обновление свойств экземпляра
  def update(params)
    super

    @title = params[:title] if params[:title]
    @genre = params[:genre] if params[:genre]
    @author = params[:author] if params[:author]
  end

  #Считывает свойства экземпляра класса из файла
  def self.from_file(file)
    lines = File.readlines(file, encoding: 'UTF-8', chomp: true)

    self.new(title: lines[0],
      genre: lines[1],
      author: lines[2],
      price: lines[3].to_i,
      amount: lines[4].to_i
    )
  end
end
