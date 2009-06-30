require 'fileutils'

class Style
  def initialize(photo, dir, geometry)
    @photo = photo
    @dir = dir
    @geometry = geometry
  end
  
  def needs_update?
    @photo.src_mtime > File.mtime(@dir)
  rescue Errno::ENOENT
    true
  end
  
  def update!
    FileUtils.mkdir_p(@dir) unless File.directory?(@dir)
    dest_path = File.join(@dir, @photo.src_name.gsub(/\.[^\.]+$/, ".jpg"))
    cmd = "convert #{@photo.src_path} -thumbnail #{@geometry} #{dest_path}"
    puts "running: #{cmd}"
    `#{cmd}`
  end
end
