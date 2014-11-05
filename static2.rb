require 'rack'

class NSR
  def self.call(env)
    ["200", {"Content-Type" => "text/plain"}, ["non-static resources"]]
  end
end

Rack::Server.new(app: Rack::Static.new(NSR, urls: ["/assets"], root: "public", index: "index.html")).start