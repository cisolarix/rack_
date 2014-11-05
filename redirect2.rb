require 'rack'

class Redirect
  def self.call(env)
    request = Rack::Request.new(env)
    response = Rack::Response.new("OK")
    response.redirect("http://ruby-china.org") if request.params["method"] == "redirect"
    response
  end
end

Rack::Server.new(app: Redirect).start