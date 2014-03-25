class Category
  attr_reader :name, :icons

  def initialize(name)
    @name = name

    @icons = []
  end

  def add(icon)
    @icons << icon
  end

  class << self
    def find(category_name)
      @categories[category_name]
    end

    def import(icons)
      @categories = {}

      icons.each do |icon|
        icon.categories.each do |category_name|
          if @categories[category_name].nil?
            @categories[category_name] = Category.new(category_name)
          end

          @categories[category_name].add icon
        end
      end

      @categories
    end
  end
end

