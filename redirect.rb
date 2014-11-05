require 'rack'

class Redirect
  def self.call(env)
    if env["QUERY_STRING"] =~ /method=redirect/
      ["302", {"Location" => "http://ruby-china.org"}, []]
    else
      ["200", {"Content-Type" => "text/html"}, ["I'm from redirect page."]]
    end
  end
end
 
Rack::Server.new(app: Redirect).start