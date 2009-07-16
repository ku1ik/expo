class Directory
  attr_reader :path

  def initialize(cfg_path)
    @path = File.dirname(cfg_path)
    @cfg = YAML.load_file(cfg_path)
  end

  def name
    @cfg["name"]
  end
  
  def dirname
    File.basename(@path)
  end
end
