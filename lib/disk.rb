class Disk < Product
  attr_accessor :title, :singer, :genre, :year

  def initialize(params)
    super

    @title = params[:title]
    @singer = params[:singer]
    @genre = params[:genre]
    @year = params[:year]
  end

  def to_s
    "Альбом #{@singer} - \"#{@title}\", #{@genre}, #{year}, #{super}"
  end

  def update(params)
    super

    @title = params[:title] if params[:title]
    @genre = params[:genre] if params[:genre]
    @singer = params[:singer] if params[:singer]
    @year = params[:year] if params[:year]
  end

  def self.from_file(file)
    lines = File.readlines(file, encoding: 'UTF-8', chomp: true)

    self.new(title: lines[0],
      singer: lines[1],
      genre: lines[2],
      year: lines[3].to_i,
      price: lines[4].to_i,
      amount: lines[5].to_i
    )
  end
end
