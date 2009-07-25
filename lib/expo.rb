#!/usr/bin/ruby

class Expo
  attr_reader :output_dir
  
  def initialize(root_dir, output_dir)
    @root_dir = root_dir
    @output_dir = output_dir
  end
  
  def categories
    @categories ||= Dir.glob(@root_dir + "/**/category.yml").map { |cat_cfg| Category.new(self, cat_cfg) }
  end
  
  def inspect!(with_update=false)
    categories.each do |c|
      puts "[C] #{c.name.color(:blue)} (#{c.relative_path})"
      c.albums.each do |album|
        puts "  [A] #{album.name.color(:green)} (#{album.relative_path}, #{album.photos.size} photos)"
        album.update! if with_update
      end
    end
  end
  
  def update!
    inspect!(true)
  end
  
end
