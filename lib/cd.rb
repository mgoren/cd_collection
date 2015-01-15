class CD

  attr_reader(:title, :artist)

  define_method(:initialize) do |attributes|
    @title = attributes.fetch(:title)
    @artist = attributes.fetch(:artist)
  end


end
