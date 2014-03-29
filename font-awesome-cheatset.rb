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

    td.description .name {
      display: none;
    }

    .iterate-icons td.command {
      width: 16em;
    }

    .single-icon td.description {
      width: 1%;
      text-align: center;
    }

    .example-single-command td.command,
    .example-single-command td.td_command:nth-child(1) {
      width: 12em;
    }

    .example-single-command.category-layouts td.description {
      /* override width for Layouts category */
      width: 13em;
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

    html_class "example-single-command single-icon"

    entry do
      td_command ""
      name "Normal Size"
      notes "<i class='fa fa-camera-retro'></i>"

      td_notes "Normal Size"
    end

    entry do
      command "fa-lg"
      name "33% Larger"
      notes "<i class='fa fa-camera-retro fa-lg'></i>"

      td_notes "33% Larger"
    end

    entry do
      command "fa-2x"
      name "2x"
      notes "<i class='fa fa-camera-retro fa-2x'></i>"

      td_notes "2x"
    end

    entry do
      command "fa-3x"
      name "3x"
      notes "<i class='fa fa-camera-retro fa-3x'></i>"

      td_notes "3x"
    end

    entry do
      command "fa-4x"
      name "4x"
      notes "<i class='fa fa-camera-retro fa-4x'></i>"

      td_notes "4x"
    end

    entry do
      command "fa-5x"
      name "5x"
      notes "<i class='fa fa-camera-retro fa-5x'></i>"

      td_notes "5x"
    end
  end

  category do
    id "Changing Color"
    html_class "example-single-command single-icon"

    entry do
      command "fa-inverse"

      name "Inverse Color (White)"

      notes <<-EOS
        <p style='background-color: aliceblue'><i class="fa fa-tags fa-inverse"></i></p>
      EOS

      td_notes "Inverse Color (White)"
    end

    entry do
      td_command ""
      name "Any Color"

      notes <<-EOS
        <i class="fa fa-tags" style="color: #bada55"></i>
      EOS

      td_notes "Apply CSS `color: ` property to change color."
    end
  end

  category do
    id "Layouts"

    html_class "example-single-command category-layouts"

    entry do
      command "fa-fw"
      name "Fixed Width"

      notes <<-EOS
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

      notes <<-EOS
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

      notes <<-EOS
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

      notes <<-EOS
      <i class="fa fa-quote-left pull-left fa-lg fa-border"></i>
      Lorem ipsum dolor sit amet, consectetur adipisicing elit.
      EOS

      td_notes <<-EOS
      Use Pull Left / Right to make it floating

      ```html
      <i class="fa fa-quote-left pull-left fa-border"></i>
      Lorem ipsum dolor sit amet, consectetur adipisicing elit.
      ```
      EOS
    end
  end

  category do
    id "Rotate & Flip"

    html_class "example-single-command single-icon"

    entry do
      td_command ""

      name "Normal"
      notes "<i class='fa fa-lg fa-music'></i>"

      td_notes "Normal"
    end

    entry do
      command "fa-rotate-90"

      name "Rotate 90°"
      notes "<i class='fa fa-lg fa-music fa-rotate-90'></i>"

      td_notes "Rotate 90°"
    end

    entry do
      command "fa-rotate-180"

      name "Rotate 180°"
      notes "<i class='fa fa-lg fa-music fa-rotate-180'></i>"

      td_notes "Rotate 180°"
    end

    entry do
      command "fa-rotate-270"

      name "Rotate 270°"
      notes "<i class='fa fa-lg fa-music fa-rotate-270'></i>"

      td_notes "Rotate 270°"
    end

    entry do
      command "fa-flip-horizontal"

      name "Flip Horizontally"
      notes "<i class='fa fa-lg fa-music fa-flip-horizontal'></i>"

      td_notes "Flip Horizontally"
    end

    entry do
      command "fa-flip-vertical"

      name "Filp Vertically"
      notes "<i class='fa fa-lg fa-music fa-flip-vertical'></i>"

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

      html_class "iterate-icons single-icon"

      icon_category.icons.each do |icon|
        entry do
          command "fa-#{icon.id}"

          name icon.name
          notes "<i class='fa fa-#{icon.id} fa-2x fa-fw'></i>"

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
