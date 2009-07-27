require 'fileutils'

class Style < Entity
  
  def initialize(photo, dir, geometry)
    @photo = photo
    @dir = dir
    @geometry = geometry
    @path = File.join(@dir, @photo.src_name.gsub(/\.[^\.]+$/, ".jpg"))
  end
  
  def needs_update?
    @photo.src_mtime > File.mtime(@path)
  rescue Errno::ENOENT
    true
  end
  
  def update_photo!
    return unless needs_update?
    @photo.mark_as_dirty!
    print "    [P] #{@photo.src_name.color(:yellow)}, updating style #{@geometry.color(:magenta)}..."
    FileUtils.mkdir_p(@dir) unless File.directory?(@dir)
    cmd = "convert #{@photo.src_path} -thumbnail #{@geometry} #{@path}"
    puts "running: #{cmd}" if $DEBUG
    #`#{cmd}`
    puts "done"
  end
  
end
