class Category < Entity
  attr_reader :home
  
  def initialize(home, cfg_path)
    @home = home
    super(cfg_path)
    @html_path = File.join(dirname, "index.html")
  end
  
  def albums
    @albums ||= Dir.glob(@path + "/**/album.yml").map { |album_cfg| Album.new(self, album_cfg) }
  end
  
  def mark_as_dirty!
    super
    home.mark_as_dirty!
  end

  def update_photos!
    albums.each do |album|
      puts "  [A] #{album.name.color(:green)} (#{album.relative_path}, #{album.photos.size} photos)"
      album.update_photos! #if with_update
    end
  end
end

