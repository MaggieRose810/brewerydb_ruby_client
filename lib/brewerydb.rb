require 'rubygems'
require 'bundler/setup'
require 'net/http'
require 'json'
require 'ostruct'
Bundler.setup
require 'active_support'
require 'active_support/core_ext'
require 'active_support/inflector'
require 'recursive-open-struct'
require_relative 'brewerydb/config'
require_relative 'brewerydb/base'
require_relative 'brewerydb/base_collection'
require_relative 'brewerydb/http'

require_relative 'brewerydb/adjunct'
require_relative 'brewerydb/adjuncts'
require_relative 'brewerydb/brewery'
require_relative 'brewerydb/breweries'
require_relative 'brewerydb/beer'
require_relative 'brewerydb/beers'
require_relative 'brewerydb/category'
require_relative 'brewerydb/categories'
require_relative 'brewerydb/change'
require_relative 'brewerydb/changes'
require_relative 'brewerydb/event'
require_relative 'brewerydb/events'
require_relative 'brewerydb/feature'
require_relative 'brewerydb/features'
require_relative 'brewerydb/fermentable'
require_relative 'brewerydb/fermentables'
require_relative 'brewerydb/fluidsize'
require_relative 'brewerydb/fluidsizes'
require_relative 'brewerydb/glass'
require_relative 'brewerydb/glassware'
require_relative 'brewerydb/hop'
require_relative 'brewerydb/hops'
require_relative 'brewerydb/ingredient'
require_relative 'brewerydb/ingredients'
require_relative 'brewerydb/location'
require_relative 'brewerydb/locations'
require_relative 'brewerydb/socialsite'
require_relative 'brewerydb/socialsites'
require_relative 'brewerydb/style'
require_relative 'brewerydb/styles'
require_relative 'brewerydb/yeast'
require_relative 'brewerydb/yeasts'

ActiveSupport::Inflector.inflections(:en) do |inflect|
  inflect.irregular 'glass', 'glassware'
end

module Brewerydb
  def self.configure
    @config = Brewerydb::Config.new
    yield(@config)
  end

  def self.config
    @config
  end
end