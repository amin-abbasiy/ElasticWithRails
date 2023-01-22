class Mapping::Create
  def initialize(data, path, callback)
    @path = path
    @data = data
    @callback = callback
  end

  def call
    ::Logs::Validate.new(@data).call

    @response = ::Logs::Request.new(@data.to_json, :put, @path).call
  end

  attr_reader :path, :data, :callback, :response
end