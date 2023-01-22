class Logs::LogSearch
  def initialize(term, callback)
    @term = term
    @callback = callback
  end

  def call
    ::Logs::Validate.new(@term).call

    path = "_search"
    @response = ::Logs::Request.new(@term, :get, path).call
  end

  private

  attr_reader :term, :callback, :response
end