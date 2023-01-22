class Logs::Create
  def initialize(data, callback)
    @data = data
    @callback = callback
  end

  def call
    ::Logs::Validate.new(@data).call

    path = "/logs/_doc"
    @response = ::Logs::Request.new(@data.to_json, :post, path).call
  end

  private

  attr_reader :callback, :data, :response
end