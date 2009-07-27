require 'expo.rb'

namespace :expo do
  desc "Inspect albums"
  task :inspect do
    puts "Inspecting..."
    Expo.root = File.expand_path('.')
    Expo.output_dir = File.expand_path('./.site/output/images')
    Expo.inspect!
  end

  desc "Update albums"
  task :update do
    Expo.root = File.expand_path('.')
    Expo.output_dir = File.expand_path('./.site/output/images')
    Expo.update!
    puts "Finished."
  end

  desc "Generate site"
  task :prepare do
    `nanoc create_site .site`
    `mkdir -p .site/output/images`
    `ln -s .site/output output`
  end
end
