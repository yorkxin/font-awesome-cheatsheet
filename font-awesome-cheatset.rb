require 'yaml'
require 'fileutils'

autoload :Icon,     "./icon"
autoload :Category, "./category"

ROOT_DIR = "Font-Awesome"

config = YAML.load_file File.join(ROOT_DIR, "_config.yml")
icons = (YAML.load_file File.join(ROOT_DIR, config['icon_meta']))['icons']
          .map { |icon| Icon.new(icon) }

fontawesome = config['fontawesome']

Category.import(icons)

# Copy Assets to assets/
FileUtils.mkdir_p 'assets/css'
FileUtils.mkdir_p 'assets/fonts'
FileUtils.cp File.join(ROOT_DIR, 'css', 'font-awesome.css'), 'assets/css/'
FileUtils.cp File.join(ROOT_DIR, 'fonts', 'fontawesome-webfont.woff'), 'assets/fonts/'

# Generate Dash Cheatsheet
cheatsheet do
  title "Font Awesome #{fontawesome['version']}"
  docset_file_name 'Font Awesome'
  
  keyword 'fa'           # Used as the initial search keyword (listed in Preferences > Docsets)
  resources 'assets'  # An optional resources folder which can contain images or anything else

  source_url 'https://github.com/chitsaou/font-awesome-cheatsheet'

  style <<-EOS
    @import 'assets/css/font-awesome.css';

    td:nth-child(1) {
      width: 16em;
      text-align: left;
    }

    td:nth-child(2) {
      width: 1.5em;
      text-align: center;
    }
  EOS

  introduction "Font Awesome Lookup"

  [
    'Web Application Icons',
    'Form Control Icons',
    'Currency Icons',
    'Text Editor Icons',
    'Directional Icons',
    'Video Player Icons',
    'Brand Icons',
    'Medical Icons',
  ].each do |category_name|
    category do
      icon_category = Category.find(category_name)

      id icon_category.name

      icon_category.icons.each do |icon|
        entry do
          name "<i class='fa fa-#{icon.id} fa-lg fa-fw'></i> <span hidden>#{icon.name}</span>"
          command "fa-#{icon.id}"

          td_notes icon.name

          icon.aliases.each do |alias_id|
            command "fa-#{alias_id}"
          end
        end
      end
    end
  end
end
