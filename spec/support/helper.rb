module Helper
  def whitelist_params
      {
        "ip": "::1",
        "path": "/",
        "creation_time": 1674471553,
        "request_info": {
          "request_id": "03b78629-2c87-4444-8db9-b77a07a69493",
          "method": "GET",
          "url": "http://localhost:3000/"
        }
      }
  end

  def corrupt_params
    {
      "ip": "::1",
      "path": "/",
      "creation_time": 1674471553,
      "request_info": {
        "request_id": "03b78629-2c87-4444-8db9-b77a07a69493",
        "method": "GET",
        "url": 12
      }
    }
  end

  def corrupt_date_params
    {
      "ip": "::1",
      "path": "/",
      "creation_time": "2022",
      "request_info": {
        "request_id": "03b78629-2c87-4444-8db9-b77a07a69493",
        "method": "GET",
        "url": "http://localhost:3000/"
      }
    }
  end

  def default_mapping
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

  def elastic_response

  end

  def elastic_error

  end
end