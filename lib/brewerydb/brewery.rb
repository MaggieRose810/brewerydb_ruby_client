module Brewerydb
  class Brewery < Base
    collection_path '/breweries'
    member_path '/brewery'
    def self.beers(brewery_id, params = {})
      response = http.get("#{@member_path}/#{brewery_id}/beers", params)
      Beers.new(response['data'])
    end
  end
end