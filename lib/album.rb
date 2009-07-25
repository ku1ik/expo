class Album < Directory
  attr_reader :category
  attr_reader :html_path
  
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
  
  def update!
    photos.each do |photo|
      photo.update!
    end
  end
  
  def mark_as_dirty!
    @dirty = true
    category.mark_as_dirty!
  end

end
