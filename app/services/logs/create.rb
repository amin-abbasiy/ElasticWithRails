class Logs::Create
  def initialize(data, callback)
    @data = data
    @callback = callback
  end

  def call
    ::Logs::Validate.new(@data).call

    path = "/logs/_doc"
    request = ::Logs::Request.new(@data).call
    @response = request.post(path)
  end

  private

  attr_reader :callback, :data, :response
end