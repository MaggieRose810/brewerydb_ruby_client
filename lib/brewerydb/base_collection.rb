module Brewerydb
  class BaseCollection
    include Enumerable
    delegate :each, :<<, to: :items

    def initialize(items, options = {})
      klass = Brewerydb.const_get(ActiveSupport::Inflector.singularize(self.class.name))
      @items =  Array(items).map { |i| i.is_a?(klass) ? i : klass.new(i) }
      @options = options
    end

    def items
      @items
    end

    def current_page
      @options["currentPage"]
    end

    def number_of_pages
      @options["numberOfPages"]
    end

  end
end