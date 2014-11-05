simplest = Proc.new do |env|
  ["200", {"content-type" => "text/html"}, ["I'm from simplest rack app."]]
end

run simplest