# frozen_string_literal: true

def application_layout_path(ext)
  File.expand_path("#{Rails.root}/app/views/layouts/application.html.#{ext}", __FILE__)
end

file_ext = %w(erb haml slim).select do |ext|
  file_path = application_layout_path(ext)
  FileTest.exist?(file_path)
end.first

if yes?('デフォルトでcss(sass)をwebpackで管理するように設定しますか？ (y/n)')
  gsub_file application_layout_path(file_ext), 
            "stylesheet_link_tag", "stylesheet_pack_tag"

  run 'mkdir -p app/javascript/stylesheets && touch app/javascript/stylesheets/application.scss'

  append_to_file 'app/javascript/packs/application.js', "import '../stylesheets/application'\n"
end
