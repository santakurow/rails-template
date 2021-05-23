# frozen_string_literal: true

if yes?('Would you like to setup webpack bundle for assets(css)?')
  gsub_file 'app/views/layouts/application.html.erb',
            "<%= stylesheet_link_tag 'application', media: 'all', 'data-turbolinks-track': 'reload' %>",
            "<%= stylesheet_pack_tag 'application', media: 'all', 'data-turbolinks-track': 'reload' %>"

  run 'mkdir -p app/javascript/stylesheets && touch app/javascript/stylesheets/application.scss'

  inject_into_file 'app/javascript/packs/application.js', "import '../stylesheets/application'\n",
                   before: /^Rails.start()/
end
