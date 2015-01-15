class Collection
  @@collections = []

  define_method(:initialize) do
    @all_discs = []
    @id_counter = 0
  end

  define_method(:add_disc) do |disc|
    @all_discs.push(disc)
    @id_counter += 1
    disc.assign_id(@id_counter)
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

  define_method(:save) do
    @@collections.push(self)
  end

  define_singleton_method(:last) do
    @@collections.last()
  end

  define_singleton_method(:clear) do
    @@collections = []
    @all_discs = []
  end

  define_method(:search) do |attributes|
    title = attributes[:title]
    artist = attributes[:artist]
    ids = []
    @all_discs.each() do |disc|
      if disc.artist() == artist || artist == nil
        if disc.title() == title || title == nil
          ids.push(disc.id())
        end
      end
    end
    ids
  end

  define_method(:delete_cd) do |ids|
    ids.each() do |id|
      @all_discs.each() do |disc|
        if disc.id() == id
          @all_discs.delete(disc)
        end
      end
    end
  end

end
