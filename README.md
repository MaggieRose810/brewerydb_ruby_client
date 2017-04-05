# Brewerydb::Client

# Installation

Add this line to your application’s Gemfile:
```
gem 'brewerydb-client', require: 'brewerydb'
```
And then execute:

```
bundle
```

# Configuration

You must have a valid API key to use the BreweryDB API. If you don’t yet have one, you may request one here.

You can use the following method to configure your API key:
```
Brewerydb.configure do |config|
  config.api_key = '123abc'
end
```

# Usage
Search for breweries with request parameters
```
breweries = Brewerydb::Brewery.index(established: 2016)

breweries.map do |brewery|
  puts brewery.id
end
```

Find a specific brewery's name
```
Brewerydb::Brewery.show('yrqy3m').name
```

Searching for beers without parameters
```
beers = Brewerydb::Beer.index
beers.map do |beer|
  puts beer.style.category.name if beer.style
end
```

Pagination data
```
beers.current_page
beers.number_of_pages
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

