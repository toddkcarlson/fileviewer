desc "This task is called by the Heroku scheduler add-on"
task :clear_db => :environment do
  Kml.all.destroy
end