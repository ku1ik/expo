#!/usr/bin/ruby

class Expo
  # attr_reader :root_dir
  attr_reader :output_dir
  
  def self.root=(path)
    @@root = path
  end
  
  def self.root
    @@root
  end
  
  def self.output_dir=(path)
    @@output_dir = path
  end
  
  def self.output_dir
    @@output_dir
  end
  
  #def initialize(output_dir)
  #  @output_dir = output_dir
  #  @home = Home.new(self)
  #end
  
  def self.update!
    @@home = Home.new(@@root)
    update_photos!
    update_pages!
  end
  
  # def inspect!(with_update=false)
    # @home.update_photos!
  # end
  
  def self.update_photos!
    puts "Updating photos..."
    # inspect!(true)
    @@home.update_photos!
  end
  
  def self.update_pages!
    puts "Updating pages..."
    puts "dirty pages:"
    puts @@home.html_path if @@home.dirty
    @@home.categories.each do |c|
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
