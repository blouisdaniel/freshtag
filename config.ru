#!/usr/bin/env ruby

use Rack::Static,
  :urls => ["/images", "/stylesheets"],
  :root => "public"

run lambda { |env|
  [ 
    200,
    {
      'Content-Type' => "text/html",
      "Cache-Control" => "public, must-revalidate, max-age=0"
    },
    File.open("public/index.html")
  ]
}
  