class Album < Entity
  attr_reader :category
  
  def initialize(cat, cfg_path)
    @category = cat
    super(cfg_path)
    @html_path = File.join(cat.dirname, dirname, "index.html")
  end
  
  def expo
    category.expo
  end

  def photos
    @photos ||= Dir.glob(@path + "/**/*.JPG").map { |file| Photo.new(self, file) }
  end
  
  def update_photos!
    photos.each { |photo| photo.update_photo! }
  end
  
  def mark_as_dirty!
    super
    category.mark_as_dirty!
  end

end
