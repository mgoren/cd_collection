require('sinatra')
require('sinatra/reloader')
also_reload('/lib/**/*.rb')
require('./lib/cd')
require('./lib/collection')

get('/') do
  @collection = Collection.last()
  if @collection == nil
    @collection = Collection.new()
    @collection.save()
  end
  erb(:index)
end

post('/success') do
  artist = params.fetch('artist')
  title = params.fetch('title')
  new_disc = CD.new({:title => title, :artist => artist})
  Collection.last().add_disc(new_disc)
  redirect("/")
end

post('/delete') do
  artist = params['artist']
  title = params['title']
  if artist == ""
    artist = nil
  end
  if title == ""
    title = nil
  end
  collection  = Collection.last()
  ids = collection.search({:artist => artist, :title => title})
  collection.delete_cd(ids)
  redirect("/")
end

get('/search') do
  @collection = Collection.last()
  @artist = params['artist']
  @matches = Collection.last().search_by_artist(@artist)
  erb(:index)
end
