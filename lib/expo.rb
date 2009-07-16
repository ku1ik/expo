#!/usr/bin/ruby

class Expo
  attr_reader :output_dir
  
  def initialize(root_dir, output_dir)
    @root_dir = root_dir
    @output_dir = output_dir
  end
  
  def categories
    @categories ||= Dir.glob(@root_dir + "/**/.category").map { |cat_cfg| Category.new(self, cat_cfg) }
  end
  
  def update!
    categories.each do |c|
      puts "Category '#{c.name}' at '#{c.path}'"
      c.albums.each do |album|
        puts "Album '#{album.name}' at '#{album.path}'"
        album.photos.each do |photo|
          puts "Photo '#{photo.src_name}'"
          photo.update!
        end
      end
    end
  end
  
end
