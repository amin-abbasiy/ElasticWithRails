class Mapping::Retrieve
  def initialize(path, callback)
    @path = path
    @callback = callback
  end

  def call
    @response = ::Logs::Request.new(nil, :get, @path).call
  end

  private
  attr_reader :path, :callback, :response
end