class Logs::LogSearch
  def initialize(term, callback)
    @term = term
    @callback = callback
  end

  def call
    ::Logs::Validate.new(@data).call

    path = "_search"
    request = ::Logs::Request.new(@data).call
    @response = request.get(path, @data)

    @response
  end

  private

  attr_reader :term, :callback, :response
end