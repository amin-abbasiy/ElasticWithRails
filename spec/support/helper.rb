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
        "url": "http://localhost:3000"
      }
    }.to_json
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

  def elastic_create_response
    {
      "_index"=>"logs",                                 
      "_id"=>"5WRk3oUBb6wkQSzB-U-d",                    
      "_version"=>1,                                    
      "result"=>"created",                              
      "_shards"=>{"total"=>2, "successful"=>1, "failed"=>0},
      "_seq_no"=>21,                                    
      "_primary_term"=>5
    }
  end

  def elastic_error
    {
      "error"=>                                         
      {
      "root_cause"=>[{
        "type"=>"mapper_parsing_exception", "reason"=>"failed to parse"
        }],
      "type"=>"mapper_parsing_exception",             
      "reason"=>"failed to parse",                    
      "caused_by"=>                                   
        {
          "type"=>"not_x_content_exception",            
        "reason"=>"Compressor detection can only be called on some xcontent bytes or compressed xcontent bytes"
        }
      },
      "status"=>400
    }
  end
end