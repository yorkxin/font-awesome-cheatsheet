class Icon
  attr_reader :name, :id, :unicode, :created, :categories, :aliases

  def initialize(options={})
    @name       = options['name']
    @id         = options['id']
    @unicode    = options['unicode']
    @created    = options['created']
    @categories = options['categories']
    @aliases    = options['aliases'] || []
  end
end
