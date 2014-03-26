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

    td.command {
      width: 16em;
      text-align: left;
    }

    .iterate-icons td:nth-child(2) {
      width: 1.5em;
      text-align: center;
    }
  EOS

  introduction "Lookup Font Awesome icons."

  category do
    id "Basic Usage"

    entry do
      notes <<-EOS
      <i class="fa fa-camera-retro"></i>

      ```html
      <i class="fa fa-camera-retro"></i>
      ```
      EOS
    end
  end

  category do
    id "Larger Icons"

    entry do
      command "fa-lg"
      name "<i class='fa fa-camera-retro fa-lg'></i> <span hidden>33% Larger</span>"

      td_notes "33% Larger"
    end

    entry do
      command "fa-2x"
      name "<i class='fa fa-camera-retro fa-2x'></i> <span hidden>2x</span>"

      td_notes "2x"
    end

    entry do
      command "fa-3x"
      name "<i class='fa fa-camera-retro fa-3x'></i> <span hidden>3x</span>"

      td_notes "3x"
    end

    entry do
      command "fa-4x"
      name "<i class='fa fa-camera-retro fa-4x'></i> <span hidden>4x</span>"

      td_notes "4x"
    end

    entry do
      command "fa-5x"
      name "<i class='fa fa-camera-retro fa-5x'></i> <span hidden>5x</span>"

      td_notes "5x"
    end
  end

  category do
    id "Styles"

    entry do
      command "fa-fw"
      name <<-EOS
        <p><i class='fa fa-desktop fa-lg fa-fw' style="background-color: aliceblue;"></i></p>
        <p><i class='fa fa-mobile  fa-lg fa-fw' style="background-color: aliceblue;"></i></p>
        <span hidden>Fixed Width Icons</span>
      EOS

      td_notes <<-EOS
      Fixed Width Icons

      Use `fa-fw` to set icons at a fixed width.
      Great to use when variable icon widths throw off alignment.
      Especially useful in things like nav lists.
      EOS
    end
  end

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

      html_class "iterate-icons"

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

  notes <<-EOS
  * Font Awesome by Dave Gandy - http://fontawesome.io
  EOS
end
