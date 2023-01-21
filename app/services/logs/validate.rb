class ::Logs::Validate
  def initialize(json)
    @json = json
  end

  def call
    ::JSON.parse(@json)

    rescue JSONError => e
      e.message
  end

  private

  attr_reader :json
end