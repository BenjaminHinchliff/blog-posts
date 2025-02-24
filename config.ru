require 'rack'
require 'rack/contrib'
require 'dotenv/load'

# Configuration
static_directory = File.expand_path('../_site', __FILE__) # 'public' folder

app = Rack::Builder.new do
  use Rack::Static,
    :urls => ["/"],
    :root => static_directory,
    :index => "index.html",
    :cascade => true
  map "/rebuild" do
    run lambda { |env| 
      if env["HTTP_AUTHORIZATION"] != "Bearer #{ENV['CRON_SECRET']}" then
        return [401, {}, ["Unauthroized"]]
      end
      pid = Process.fork
      if pid.nil? then
        exec 'jekyll', 'build'
      else
        Process.detach(pid)
      end
      [200, {'content-type' => 'text/plain'}, ['OK']] }
  end
  run Rack::NotFound.new(File.join(static_directory, '404.html'))
end

run app
