class Category < Directory
  attr_reader :expo
  attr_reader :html_path
  
  def initialize(expo, cfg_path)
    @expo = expo
    super(cfg_path)
    @html_path = File.join(dirname, "index.html")
  end
  
  def albums
    @albums ||= Dir.glob(@path + "/**/album.yml").map { |album_cfg| Album.new(self, album_cfg) }
  end
  
  def mark_as_dirty!
    @dirty = true
    expo.mark_as_dirty!
  end

end

