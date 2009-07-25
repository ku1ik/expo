class Directory
  attr_reader :path
  attr_reader :relative_path
  attr_accessor :dirty
  
  def initialize(cfg_path)
    @path = File.dirname(cfg_path)
    @relative_path = @path.gsub(expo.root_dir + '/', '')
    @cfg = YAML.load_file(cfg_path)
  end

  def name
    @cfg["name"]
  end
  
  def dirname
    File.basename(@path)
  end
end
