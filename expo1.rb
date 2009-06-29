#!/usr/bin/ruby

class A
  attr_reader :path

  def initialize(cfg_path)
    @path = File.dirname(cfg_path)
    @cfg = YAML.load_file(cfg_path)
  end

  def name
    @cfg["name"]
  end
end

class Category < A
  def self.all
    @categories ||= Dir.glob("**/.category").map { |cat_cfg| Category.new(cat_cfg) }
  end

  def albums
    @albums ||= Dir.glob(@path + "/**/.gallery").map { |album_cfg| Album.new(album_cfg) }
  end
end

class Album < A
end

Category.all.each do |c|
  puts "Category '#{c.name}' at '#{c.path}'"
  c.albums.each do |album|
    puts "Album '#{album.name}' at '#{album.path}'"
  end
end
