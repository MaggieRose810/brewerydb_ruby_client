module Brewerydb
  class Beer < Base
    collection_path '/beers'
    member_path '/beer'
  end
end