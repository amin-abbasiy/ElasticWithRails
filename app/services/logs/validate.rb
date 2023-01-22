class ::Logs::Validate
  def initialize(json)
    @json = json
  end

  def call
    ::JSON.parse(@json.to_json)

    rescue ::JSON::JSONError => e
      e.message
  end

  private

  attr_reader :json
end