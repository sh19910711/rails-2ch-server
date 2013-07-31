source 'https://rubygems.org'

ruby '1.9.3'

gem 'rails', '3.2.13'

group :development do
  gem 'mysql2'            # MySQL用
  gem 'pry-rails'         # Railsコンソールを良い感じにする
  gem 'better_errors'     # エラー出力を良い感じにする
  gem 'binding_of_caller' # better_errors用
  gem 'backup'            # データベースのダンプ用
end

group :test do
  gem 'rake'

  # RSpec関連
  gem 'rspec'             # テスト
  gem 'rspec-rails'
  gem 'spork'
  gem 'simplecov'         # コードのカバレッジ計測用
  gem 'simplecov-rcov'    # rcovとの互換, Jenkinsとかで
  gem 'ci_reporter'       # Jenkinsとかに渡す用のフォーマット

  gem 'nokogiri'          # HTMLパーサー, もろもろ確認用
end

group :production do
  # TODO: もっと進んだら記述しなおす
end

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'less-rails'

  gem 'twitter-bootstrap-rails'
  gem 'therubyracer'

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

