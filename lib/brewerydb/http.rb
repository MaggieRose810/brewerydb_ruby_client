require "net/http"
require "json"
require "uri"

module Brewerydb
  class HTTPResponseError < StandardError
    def initialize(msg, res)
      super(msg)
      @res = res
    end

    def code
      @res.code
    end

    def response
      @res
    end
  end

  class HTTP
    def initialize
      @host = 'api.brewerydb.com'
      @api_version = 'v2'
    end

    def get(path, params)
      uri = base_uri(path)
      uri.query = URI.encode_www_form(params_with_key(params))
      res = Net::HTTP.get_response(uri)
      parse_response(res)
    end

    def post(path, params)
      uri = base_uri(path)
      res = Net::HTTP.post_form(uri, params_with_key(params))
      parse_response(res)
    end

    def put(path, params)
      request = Net::HTTP::Put.new(path)
      req.body = params_with_key(params)
      res = Net::HTTP.new(@host).start { |http| http.request(req)}
      parse_response(res)
    end

    def delete(path)
      res = Net::HTTP.new(@host).delete(path)
      parse_response(res)    end

    private

    def base_uri(path)
       URI("http://#{@host}/#{@api_version}#{path}")
    end

    def parse_response(res)
       if res.is_a?(Net::HTTPSuccess)
        JSON.parse(res.body)
      else
        raise HTTPResponseError.new('Invalid response from Brewerydb', res)
      end
    end

    def params_with_key(params)
      params.merge({
        key: Brewerydb.config.api_key
      })
    end

  end
end
