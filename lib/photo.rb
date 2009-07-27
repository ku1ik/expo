class Photo < Entity
  attr_reader :src_mtime
  attr_reader :src_path
  attr_reader :src_name
  attr_reader :album
  
  def initialize(album, src_path)
    dest_dir = File.join(Expo.output_dir, album.category.dirname, album.dirname)
    @album = album
    @src_path = File.expand_path(src_path)
    @src_name = File.basename(@src_path)
    @dest_dir = File.expand_path(dest_dir)
    @src_mtime = File.mtime(@src_path)
    @style_defs = { :square => "75x75", :small => "240x180", :full => "800x600" }
    @styles = @style_defs.map { |name, geo| Style.new(self, File.join(@dest_dir, name.to_s), geo) }
    @html_path = File.join(album.category.dirname, album.dirname, src_name.gsub(/\.[^\.]+$/, ".html"))
  end
  
  def update_photo!
    @styles.each { |style| style.update_photo! }
  end
  
  def mark_as_dirty!
    super
    album.mark_as_dirty!
  end
  
end
