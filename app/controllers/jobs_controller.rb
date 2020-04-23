class JobsController < ApplicationController

  def index
    require 'net/http'
    require 'uri'

    uri = URI.parse("https://api.jobspikr.com/v2/data")
    request = Net::HTTP::Post.new(uri)
    request.basic_auth("ror_h_jp_sandbox_50186edf27", "yclR9eg01K3F_rTI160cbRcWoTWebXll9gRNp_Rf5mo")
    request.content_type = "application/json"
    request.body = JSON.dump( {size: 100,
      cursor: 0,
      search_query_json: {
        bool: {
          must: [
            {
              query_string: {
                default_field: "job_title",
                query: "java developer"
              }
            },
            {
              query_string: {
                default_field: "company_name",
                query: "accenture" 
              }
            }
          ]
        }
      }
    })
    req_options = {
      use_ssl: uri.scheme == "https",      
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end
    # response.code
    # response.body
    File.open("public/jobs/jobs.json","w") do |f|
      f.write(JSON.parse(response.body))
    end
  end
end
