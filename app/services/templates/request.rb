class Templates::Request
  def initialize(data, callback)
    @data = data
    @callback = callback
  end

  def call
    ::Logs::Validate.new(@data).call

  end

  private
  attr_reader :data, :callback, :response
end