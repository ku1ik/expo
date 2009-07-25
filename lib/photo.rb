class Photo
  attr_reader :src_mtime
  attr_reader :src_path
  attr_reader :src_name
  
  def initialize(album, src_path)
    dest_dir = File.join(album.category.expo.output_dir, album.category.dirname, album.dirname)
    @src_path = File.expand_path(src_path)
    @src_name = File.basename(@src_path)
    @dest_dir = File.expand_path(dest_dir)
    @src_mtime = File.mtime(@src_path)
    @style_defs = { :square => "75x75", :small => "240x180", :full => "800x600" }
    @styles = @style_defs.map { |name, geo| Style.new(self, File.join(@dest_dir, name.to_s), geo) }
  end
  
  def update!
    @styles.each { |style| style.update! }
  end
  
end

