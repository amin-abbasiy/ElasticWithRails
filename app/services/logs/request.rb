require 'net/http'
class Logs::Request
  def initialize(body, verb, path)
    @verb = verb
    @body = body
    @path = path
    @headers = { 'Content-Type' => 'application/json' }
    @url = URI(ENV.fetch("ELASTIC_URL", 'http://0.0.0.0')).host
    @port = ENV.fetch("ELASTIC_PORT", '9200')
  end

  def call
    @http = ::Net::HTTP.new(@url, @port)
    self.send(@verb)
  end

  private
    attr_reader :data, :verb, :http,
                :headers, :body, :url,
                :port, :path

  def post
    @http.post(@path, @body, @headers)
  end

  def get
    @path += '?' + URI.encode_www_form(@body) if @body.present?
    
    @http.get(@path, @headers)
  end

  def put
    @http.put(@path, @body, @headers)
  end

  def delete
    @http.delete(@path, @headers)
  end
end