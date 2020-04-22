class PagesController < ApplicationController
  require 'net/http'

  def home
  end

  def landing

    # first way


    # uri = URI.parse("http://api.jobspikr.com/v2/data")
    # http = Net::HTTP.new(uri.host, uri.port)
    # request = Net::HTTP::Post.new(uri.request_uri)
    # request.set_form_data({"user[name]" => "testusername", "user[email]" => "testemail@yahoo.com"})
    # response = http.request(request)
    # render :json => response.body

    # second way
    
    # HTTParty.post("https://api.jobspikr.com/v2/data", basic_auth: { username: "ror_h_jp_sandbox_50186edf27", password: "yclR9eg01K3F_rTI160cbRcWoTWebXll9gRNp_Rf5mo-xx" },headers: { 'Content-Type' => 'application/json' },body: {name: "FAVORITEJOKE",type: "text",}.to_json)

  end

end
