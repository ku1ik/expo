class Category < Directory
  attr_reader :expo
  
  def initialize(expo, cfg_path)
    @expo = expo
    super(cfg_path)
  end
  
  def albums
    @albums ||= Dir.glob(@path + "/**/.gallery").map { |album_cfg| Album.new(self, album_cfg) }
  end
  
end

