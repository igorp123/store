class Movie < Product
  attr_accessor :title, :year, :director

  def initialize(params)
    super

    @title = params[:title]
    @year = params[:year]
    @director = params[:director]
  end

  def to_s
    "Фильм \"#{@title}\", #{@year}, реж. #{@director}, #{super}"
  end

  def update(params)
    super

    @title = params[:title] if params[:title]
    @year = params[:year] if params[:year]
    @director = params[:director] if params[:director]
  end

  def self.from_file(file)
    lines = File.readlines(file, encoding: 'utf-8', chomp: true)

    self.new(title: lines[0],
      director: lines[1],
      year: lines[2],
      price: lines[3].to_i,
      amount: lines[4].to_i
    )
  end
end
