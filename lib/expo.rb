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


class Expo
  def self.update!
    Category.all.each do |c|
      puts "Category '#{c.name}' at '#{c.path}'"
      c.albums.each do |album|
        puts "Album '#{album.name}' at '#{album.path}'"
      end
    end
  end
end
