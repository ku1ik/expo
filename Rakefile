require 'expo.rb'

namespace :expo do
  desc "Update photos"
  task :update do
    Expo.new(File.expand_path('.'), File.expand_path('./site/output/images')).update!
  end

  desc "Generate site"
  task :gen_site do
    `nanoc create_site site`
    `mkdir -p site/output/images`
  end
end
