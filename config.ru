#!/usr/bin/env ruby

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
      "chhese"
    ]}
  end
end

run builder