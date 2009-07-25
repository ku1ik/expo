require 'expo.rb'

namespace :expo do
  desc "Inspect albums"
  task :inspect do
    puts "Inspecting..."
    Expo.new(File.expand_path('.'), File.expand_path('./.site/output/images')).inspect!
  end

  desc "Update albums"
  task :update do
    puts "Updating..."
    Expo.new(File.expand_path('.'), File.expand_path('./.site/output/images')).update!
  end

  desc "Generate site"
  task :prepare do
    `nanoc create_site .site`
    `mkdir -p .site/output/images`
    `ln -s .site/output output`
  end
end
