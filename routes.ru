app = Rack::Builder.new do
  map "/finder" do
    run Rack::Directory.new("~/")
  end

  map "/ruby" do
    run lambda {|env| ["200", {"Content-Type" => "text/html"}, ["I love Ruby."]]}
  end
end

use Rack::Runtime

run app