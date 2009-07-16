class Album < Directory
  attr_reader :category
  
  def initialize(cat, cfg_path)
    @category = cat
    super(cfg_path)
  end

  def photos
    @photos ||= Dir.glob(@path + "/**/*.JPG").map { |file| Photo.new(self, file) }
  end
  
end
