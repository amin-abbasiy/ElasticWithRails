class Logs::Request
  def initialize(data)
    @data = data
  end

  def call
    ::Faraday.new({
      url: ENV.fetch('ELASTIC_URL', 'localhost:9200'),
      params: @data,
      headers: { 'Content-Type' => 'application/json' }
    }.compact)
  end

  private

  attr_reader :data
end