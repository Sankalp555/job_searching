class JobsController < ApplicationController

  def index
    require 'net/http'
    require 'uri'
    job_title = "*"
    company_name = "*"
    if (params[:job_title].present? && params[:company_name].present?)
      job_title = params[:job_title]
      company_name = params[:company_name]
    elsif params[:job_title].present?
      job_title = params[:job_title]
    elsif params[:company_name].present?
      company_name = params[:company_name]
    end

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
                query: job_title
              }
            },
            {
              query_string: {
                default_field: "company_name",
                query: company_name 
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
    @job_data = JSON.parse(response.body)
    # debugger
    # File.open("public/jobs/jobs.json","w") do |f|
    #   f.write(data)
    # end
  end
end
