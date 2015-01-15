class CD

  attr_reader(:title, :artist, :id)

  define_method(:initialize) do |attributes|
    @title = attributes.fetch(:title)
    @artist = attributes.fetch(:artist)
  end

  define_method(:assign_id) do |id|
    @id = id
  end


end
