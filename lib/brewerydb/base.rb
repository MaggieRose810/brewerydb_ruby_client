module Brewerydb
  class Base < RecursiveOpenStruct
    def initialize(params, *options)
      super convert_hash_keys(params), *options
    end

    def http
      self.class.http
    end

    def self.http
      Brewerydb::HTTP.new
    end

    def self.collection_path(path)
      @collection_path = path
    end

    def self.member_path(path)
      @member_path = path
    end

    def self.index(params = {})
      response = http.get(@collection_path, params)
      data = response.delete('data')
      Brewerydb.const_get(ActiveSupport::Inflector.pluralize(self.name)).new(data, response)
    end

    def self.show(id, params = {})
      response = http.get("#{@member_path}/#{id}", params)
      Brewerydb.const_get(self.name).new(response['data'])
    end

    def self.create(params)
      response = http.post(@collection_path, params)
      Brewerydb.const_get(self.name).new(response['data'])
    end

    def self.update
      response = http.put("#{@member_path}/#{id}", params)
      Brewerydb.const_get(self.name).new(response['data'])
    end

    def self.delete
      response = http.delete("#{@member_path}/#{id}")
    end

    private

    def convert_hash_keys(value)
      case value
        when Array
          value.map { |v| convert_hash_keys(v) }
        when Hash
          Hash[value.map { |k, v| [k.to_s.underscore, convert_hash_keys(v)] }]
        else
          value
       end
    end
  end
end