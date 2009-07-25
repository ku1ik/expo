#!/usr/bin/ruby

class Expo
  attr_reader :root_dir
  attr_reader :output_dir
  attr_accessor :dirty
  attr_reader :html_path
  
  def initialize(root_dir, output_dir)
    @root_dir = root_dir
    @output_dir = output_dir
    @html_path = "index.html"
  end
  
  def mark_as_dirty!
    @dirty = true
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
    puts "Updating photos..."
    inspect!(true)
    puts "Updating pages..."
    update_pages!
  end
  
  def update_pages!
    puts "dirty pages:"
    puts html_path if dirty
    categories.each do |c|
      puts c.html_path if c.dirty
      c.albums.each do |a|
        puts a.html_path if a.dirty
        a.photos.each do |p|
          puts p.html_path if p.dirty
        end
      end
    end
  end
  
end
