require('rspec')
require('collection')
require('cd')

describe(Collection) do

  before() do
    Collection.clear()
  end

  describe("#add_disc") do
    it("adds a cd to the collection") do
      disc = CD.new({:title => "Love", :artist => "Cloud Cult"})
      our_awesome_music = Collection.new()
      our_awesome_music.add_disc(disc)
      expect(our_awesome_music.all()).to(eq([disc]))
    end
  end

  describe('#all') do
    it("returns all discs in collection") do
      disc = CD.new({:title => "Love", :artist => "Cloud Cult"})
      disc2 = CD.new({:title => "Black Album", :artist => "Metallica"})
      our_awesome_music = Collection.new()
      our_awesome_music.add_disc(disc)
      our_awesome_music.add_disc(disc2)
      expect(our_awesome_music.all()).to(eq([disc, disc2]))
    end
  end

  describe('#list_artists') do
    it("returns an array with all artists") do
      disc = CD.new({:title => "Love", :artist => "Cloud Cult"})
      disc2 = CD.new({:title => "Black Album", :artist => "Metallica"})
      disc3 = CD.new({:title => "White Album", :artist => "The Beatles"})
      our_awesome_music = Collection.new()
      our_awesome_music.add_disc(disc)
      our_awesome_music.add_disc(disc2)
      our_awesome_music.add_disc(disc3)
      expect(our_awesome_music.list_artists()).to(eq(["Cloud Cult", "Metallica", disc3.artist()]))
    end

    it("returns an array with all artists, without duplication") do
      disc = CD.new({:title => "Love", :artist => "Cloud Cult"})
      disc2 = CD.new({:title => "Black Album", :artist => "Metallica"})
      disc3 = CD.new({:title => "White Album", :artist => "The Beatles"})
      disc4 = CD.new({:title => "Love", :artist => "The Beatles"})
      our_awesome_music = Collection.new()
      our_awesome_music.add_disc(disc)
      our_awesome_music.add_disc(disc2)
      our_awesome_music.add_disc(disc3)
      our_awesome_music.add_disc(disc4)
      expect(our_awesome_music.list_artists()).to(eq(["Cloud Cult", "Metallica", disc3.artist()]))
    end
  end

  describe('#search_by_artist') do
    it("returns a list of titles of a given artist") do
      disc = CD.new({:title => "Love", :artist => "Cloud Cult"})
      disc2 = CD.new({:title => "Black Album", :artist => "Metallica"})
      disc3 = CD.new({:title => "White Album", :artist => "The Beatles"})
      disc4 = CD.new({:title => "Love", :artist => "The Beatles"})
      our_awesome_music = Collection.new()
      our_awesome_music.add_disc(disc)
      our_awesome_music.add_disc(disc2)
      our_awesome_music.add_disc(disc3)
      our_awesome_music.add_disc(disc4)
      expect(our_awesome_music.search_by_artist("The Beatles")).to(eq(["White Album", "Love"]))
    end
  end

  describe('#search') do
    it("returns id of disc that matches given artist & title") do
      disc = CD.new({:title => "Love", :artist => "Cloud Cult"})
      disc2 = CD.new({:title => "Black Album", :artist => "Metallica"})
      disc3 = CD.new({:title => "White Album", :artist => "The Beatles"})
      disc4 = CD.new({:title => "Love", :artist => "The Beatles"})
      our_awesome_music = Collection.new()
      our_awesome_music.add_disc(disc)
      our_awesome_music.add_disc(disc2)
      our_awesome_music.add_disc(disc3)
      our_awesome_music.add_disc(disc4)
      expect(our_awesome_music.search({:artist => "The Beatles", :title => "White Album"})).to(eq([3]))
    end

    it("returns id(s) of disc(s) that matches a given title") do
      disc = CD.new({:title => "Love", :artist => "Cloud Cult"})
      disc2 = CD.new({:title => "Black Album", :artist => "Metallica"})
      disc3 = CD.new({:title => "White Album", :artist => "The Beatles"})
      disc4 = CD.new({:title => "Love", :artist => "The Beatles"})
      our_awesome_music = Collection.new()
      our_awesome_music.add_disc(disc)
      our_awesome_music.add_disc(disc2)
      our_awesome_music.add_disc(disc3)
      our_awesome_music.add_disc(disc4)
      expect(our_awesome_music.search({:title => "Love"})).to(eq([1, 4]))
    end

  end

  describe('#delete') do

    it("deletes disc with given id") do
      disc = CD.new({:title => "Love", :artist => "Cloud Cult"})
      disc2 = CD.new({:title => "Black Album", :artist => "Metallica"})
      disc3 = CD.new({:title => "White Album", :artist => "The Beatles"})
      disc4 = CD.new({:title => "Love", :artist => "The Beatles"})
      our_awesome_music = Collection.new()
      our_awesome_music.add_disc(disc)
      our_awesome_music.add_disc(disc2)
      our_awesome_music.add_disc(disc3)
      our_awesome_music.add_disc(disc4)
      disc_to_delete = our_awesome_music.search({:title => "White Album", :artist => "The Beatles"})
      our_awesome_music.delete_cd(disc_to_delete)
      expect(our_awesome_music.all()).to(eq([disc, disc2, disc4]))
    end

    it("deletes all discs of given artist") do
      disc = CD.new({:title => "Love", :artist => "Cloud Cult"})
      disc2 = CD.new({:title => "Black Album", :artist => "Metallica"})
      disc3 = CD.new({:title => "White Album", :artist => "The Beatles"})
      disc4 = CD.new({:title => "Love", :artist => "The Beatles"})
      our_awesome_music = Collection.new()
      our_awesome_music.add_disc(disc)
      our_awesome_music.add_disc(disc2)
      our_awesome_music.add_disc(disc3)
      our_awesome_music.add_disc(disc4)
      cds_to_delete = our_awesome_music.search({:artist => "Metallica"})
      our_awesome_music.delete_cd(cds_to_delete)
      expect(our_awesome_music.all()).to(eq([disc, disc3, disc4]))
    end

  end







end
