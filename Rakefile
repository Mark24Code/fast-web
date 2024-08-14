require_relative './config'

task :check do
  if !Config::WebRepo
    puts "[Error] config.rb `Config::WebRepo` is required! "
    exit 0
  end
end

desc "setup web"
task :setup => :check do
  system("rm -rf web")
  system("git clone #{Config::WebRepo} web")
  system("cd web && npm i && npm run build")
  system("cd server && bundle install")
  system("rm -rf ./server/public && mv ./web/dist ./server/public")
end

namespace :server do
  desc "run production server"
  task :run => :check do
    Dir.chdir("server")
    # system("sudo ufw allow #{Config::PORT}")
    exec("RACK_ENV=production rackup -p #{Config::PORT}")
  end
end
