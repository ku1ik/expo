class Home < Entity
  
  def initialize(path)
    @path = path
    @html_path = "index.html"
  end
  
  def categories
    @categories ||= Dir.glob(@path + "/**/category.yml").map { |cat_cfg| Category.new(self, cat_cfg) }
  end

  def update_photos!
    categories.each do |c|
      puts "[C] #{c.name.color(:blue)} (#{c.relative_path})"
      c.update_photos!
    end
  end
end