class Create
  def initialize(data, callback)
    @data = data
    @callback = callback
  end

  def call
    ::Validate.new(@data).call

    path = "/logs/_doc"
    request = ::Request.new(@data).call
    @response = request.post(path)
  end

  private

  attr_reader :callback, :data, :response
end