#!/usr/bin/env ruby

require "opentok"

def get_session_from_opentok
  location = "localhost"
  api_key = "15935611"
  api_secret = "b644c53e81c3bd02523fa8f8d80825aa1022c2b9"
  api_url = "http://api.opentok.com/hl/session/create"
  opentok = OpenTok::OpenTokSDK.new api_key, api_secret, api_url
  opentok.create_session location
end

use Rack::Static,
  :urls => ["/images", "/stylesheets"],
  :root => "public"


default_resource = Proc.new { |env|
  [ 
    200,
    {
      'Content-Type' => "text/html",
      "Cache-Control" => "public, must-revalidate, max-age=0"
    },
    File.open("public/index.html")
  ]
}


builder = Rack::Builder.new do
  map "/" do
    run default_resource
  end

  map "/session" do
    run Proc.new {[
      200, {},
      get_session_from_opentok
    ]}
  end
end

run builder