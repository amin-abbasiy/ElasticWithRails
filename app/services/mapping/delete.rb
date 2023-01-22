class Mapping::Delete
    def initialize(path, callback)
      @path = path
      @callback = callback
    end
  
    def call  
      @response = ::Logs::Request.new(nil, :delete, @path).call
    end
  
    private

    attr_reader :path, :data, :callback, :response
  end