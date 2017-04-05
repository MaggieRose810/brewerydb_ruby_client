
describe(Brewerydb::Base) do
  it 'should convert camelcase to underscore' do
    base = Brewerydb::Base.new({ beerName: 'Blue Moon'})
    expect(base.beer_name).to eql('Blue Moon')
  end

  it 'should convert nested hashes' do
    base = Brewerydb::Base.new({ style: {category: 'pilsner'}})
    expect(base.style.category).to eql('pilsner')
  end

  describe(:index) do
    it 'should load a pluarlized constant' do
      allow_any_instance_of(Brewerydb::HTTP).to receive(:get).and_return({"data" => []})
      expect(Brewerydb).to receive(:const_get).with("Brewerydb::Bases").and_return(Brewerydb::Base)
      Brewerydb::Base.index
    end
  end
end

