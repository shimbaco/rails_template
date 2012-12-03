create_file 'lib/templates/active_record/model/model.rb' do
  path = File.expand_path('../rails_template/templates/models/model.rb')
  File.open(path).read
end

insert_into_file 'config/application.rb', after: "config.assets.version = '1.0'" do
  path = File.expand_path('../rails_template/templates/config/application.rb')
  File.open(path).read
end

gem('exception_notification')
gem('mysql2')
gem('simple_form')
gem('slim-rails')

if yes?('inherited_resources をインストールしますか?')
  gem('inherited_resources')
end

if yes?('devise をインストールしますか?')
  gem('devise')
  # generate('devise:install')
  # model_name = ask('認証に使用するモデル名を教えてください。デフォルト: user')
  # model_name = 'user' if model_name.blank?
  # generate('devise', model_name)
end

gem_group(:development, :test) do
  gem('capistrano')
  gem('capistrano-ext')
  gem('capybara')
  gem('capybara-webkit')
  gem('database_cleaner')
  gem('factory_girl_rails')
  gem('pry-rails')
  gem('rspec-rails')
  gem('rvm-capistrano')
  gem('spork-rails')
end

gem_group(:assets) do
  gem('bourbon')
  gem('flutie')
  if yes?('font-awesome-sass-rails をインストールしますか?')
    gem('font-awesome-sass-rails')
  end
end

gem_group(:development) do
  gem('awesome_print')
  gem('growl')
  gem('guard-rspec')
  gem('guard-spork')
  gem('quiet_assets')
  gem('rb-fsevent', require: false) # used in Guard
  gem('thin')
end

gem_group(:production) do
  gem('unicorn')
end

gem_group(:test) do
  gem('capybara-screenshot')
  gem('fuubar')
  gem('simplecov', require: false)
end
