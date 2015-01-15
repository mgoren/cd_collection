class Collection

  define_method(:initialize) do
    @all_discs = []
  end

  define_method(:add_disc) do |disc|
    @all_discs.push(disc)
  end

  define_method(:all) do
    @all_discs
  end

  define_method(:list_artists) do
    artists = []
    @all_discs.each() do |disc|
      if ! artists.include?(disc.artist())
        artists.push(disc.artist())
      end
    end
    artists
  end

  define_method(:search_by_artist) do |search|
    titles = []
    @all_discs.each() do |disc|
      if disc.artist().==(search)
        titles.push(disc.title())
      end
    end
    titles
  end


end
