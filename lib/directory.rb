class Directory
  attr_reader :path
  attr_reader :relative_path
  
  def initialize(cfg_path)
    @path = File.dirname(cfg_path)
    @relative_path = @path.gsub(File.expand_path('.') + '/', '')
    @cfg = YAML.load_file(cfg_path)
  end

  def name
    @cfg["name"]
  end
  
  def dirname
    File.basename(@path)
  end
end
