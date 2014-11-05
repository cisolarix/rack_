require 'rack'

class Static
  def self.call(env)
    resource = env["PATH_INFO"] =~ /\/$/ ? ["index.html"] : ["assets", env['PATH_INFO']]
    path = File.join("public", *resource)
    type = resource.last.end_with? "html"
    
    if File.exists? path
      ["200", {"Content-Type" => "text/#{type}"}, [File.read(path)]]
    else
      ["404", {"Content-Type" => "text/html"}, ["404"]]
    end
  end
end

Rack::Server.new(app: Static).start