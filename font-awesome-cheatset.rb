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
      text-align: left;
    }

    .iterate-icons td.command {
      width: 16em;
    }

    .iterate-icons td:nth-child(2) {
      width: 1.5em;
      text-align: center;
    }

    .example .description {
      display: none;
    }
  EOS

  introduction <<-EOS
  ## Basic Example

  ```html
  <i class="fa fa-camera-retro"></i>
  ```
  EOS

  category do
    id "Larger Icons"

    html_class "iterate-icons"

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
    id "Changing Color"
    html_class "example"

    entry do
      command "fa-inverse"

      name "Inverse Color (White)"

      td_notes <<-EOS
        <p style='background-color: aliceblue'><i class="fa fa-tags fa-inverse"></i></p>
      EOS

      td_notes "Inverse Color (White)"
    end

    entry do
      td_command ""
      name "Any Color"

      td_notes <<-EOS
        <i class="fa fa-tags" style="color: #bada55"></i>
      EOS

      td_notes "Apply CSS `color: ` property to change color."
    end
  end

  category do
    id "Layouts"

    html_class "example"

    entry do
      command "fa-fw"
      name "Fixed Width"

      td_notes <<-EOS
        <p><i class='fa fa-desktop fa-lg fa-fw' style="background-color: aliceblue;"></i></p>
        <p><i class='fa fa-mobile  fa-lg fa-fw' style="background-color: aliceblue;"></i></p>
      EOS

      td_notes <<-EOS
      Fixed Width Icons
      EOS
    end

    entry do
      command "fa-ul"
      command "fa-li"

      name "List Icons"

      td_notes <<-EOS
      <ul class="fa-ul">
        <li><i class="fa-li fa fa-check-square"></i>Lorem</li>
        <li><i class="fa-li fa fa-square-o"></i>ipsum</li>
        <li><i class="fa-li fa fa-square"></i>dolar</li>
      </ul>
      EOS

      td_notes <<-EOS
      List Icons (replace default bullets in `<ul>`)

      ```html
      <ul class="fa-ul">
        <li><i class="fa-li fa fa-check-square"></i>Lorem</li>
        <li><i class="fa-li fa fa-square-o"></i>ipsum</li>
        <li><i class="fa-li fa fa-square"></i>dolar</li>
      </ul>
      ```
      EOS
    end

    entry do
      command "fa-border"

      name "Bordered"

      td_notes <<-EOS
      <i class="fa fa-quote-left fa-lg fa-border"></i>
      EOS

      td_notes <<-EOS
      Bordered Icons
      EOS
    end

    entry do
      command "pull-left"
      command "pull-right"

      name "Pull Left / Right"

      td_notes <<-EOS
      <i class="fa fa-quote-left pull-left fa-lg fa-border"></i>
      Lorem Ipsum
      EOS

      td_notes <<-EOS
      Use Pull Left / Right to make it floating

      ```html
      <i class="fa fa-quote-left pull-left fa-border"></i>
      Lorem Ipsum
      ```
      EOS
    end
  end

  category do
    id "Rotate & Flip"

    html_class "iterate-icons"

    entry do
      command "fa-rotate-90"

      name <<-EOS
      <i class="fa fa-lg fa-music fa-rotate-90"></i>
      <span hidden>Rotate 90°</span>
      EOS

      td_notes "Rotate 90°"
    end

    entry do
      command "fa-rotate-180"

      name <<-EOS
      <i class="fa fa-lg fa-music fa-rotate-180"></i>
      <span hidden>Rotate 180°</span>
      EOS

      td_notes "Rotate 180°"
    end

    entry do
      command "fa-rotate-270"

      name <<-EOS
      <i class="fa fa-lg fa-music fa-rotate-270"></i>
      <span hidden>Rotate 270°</span>
      EOS

      td_notes "Rotate 270°"
    end

    entry do
      command "fa-flip-horizontal"

      name <<-EOS
      <i class="fa fa-lg fa-music fa-flip-horizontal"></i>
      <span hidden>Flip Horizontally</span>
      EOS

      td_notes "Flip Horizontally"
    end

    entry do
      command "fa-flip-vertical"

      name <<-EOS
      <i class="fa fa-lg fa-music fa-flip-vertical"></i>
      <span hidden>Filp Vertically</span>
      EOS

      td_notes "Filp Vertically"
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
