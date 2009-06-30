class Category < A
  def self.all
    @categories ||= Dir.glob("**/.category").map { |cat_cfg| Category.new(cat_cfg) }
  end

  def albums
    @albums ||= Dir.glob(@path + "/**/.gallery").map { |album_cfg| Album.new(album_cfg) }
  end
end

