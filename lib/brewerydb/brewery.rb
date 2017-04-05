module Brewerydb
  class Brewery < Base
    collection_path '/breweries'
    member_path '/brewery'
  end
end