class Entity
  attr_accessor :dirty
  attr_reader :html_path
  attr_reader :path
  attr_reader :relative_path
  
  def initialize(cfg_path)
    @path = File.dirname(cfg_path)
    @relative_path = @path.gsub(Expo.root + '/', '')
    @cfg = YAML.load_file(cfg_path)
  end

  def name
    @cfg["name"]
  end
  
  def dirname
    File.basename(@path)
  end

  def render
    puts "rednering"
  end

  def mark_as_dirty!
    @dirty = true
  end
end