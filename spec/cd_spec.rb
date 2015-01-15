require('rspec')
require('cd')
require('collection')


describe(CD) do

  describe('#title') do
    it("returns cd title") do
      cd = CD.new({:title => "White Album", :artist => "The Beatles"})
      expect(cd.title()).to(eq("White Album"))
    end
  end

  describe('#artist') do
    it("returns cd artist") do
      cd = CD.new({:title => "White Album", :artist => "The Beatles"})
      expect(cd.artist()).to(eq("The Beatles"))
    end
  end

end
