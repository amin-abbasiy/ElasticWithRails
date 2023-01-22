class Log
  class << self
    def explicit_mapping
      ::Mapping::Create.new(structure, '/logs', self).call
    end

    def remove_mapping
      ::Mapping::Delete.new('/logs', self).call
    end

    def mapping
      ::Mapping::Retrieve.new(path, self).call
    end

    private

    def structure
      {
        mappings: {
          properties: {
            ip:    { type: "ip" },
            path:  { type: "text"  },
            creation_time: { type: "date" },
            request_info: {
              properties: {
                  request_id: { type: "keyword" },
                  method: { type: "keyword" },
                  url: { type: "text" }
              }
            }
          }
        }
      }
    end

    def path
      "/logs/_mapping"
    end
  end
end
