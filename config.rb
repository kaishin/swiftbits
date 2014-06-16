require 'builder'

page '/sitemap.xml', layout: false
page '/feed.xml', layout: false

activate :syntax
activate :autoprefixer
activate :dotenv

set :markdown, fenced_code_blocks: true, smartypants: true, with_toc_data: true
set :markdown_engine, :redcarpet
set :css_dir, 'assets/stylesheets'
set :js_dir, 'assets/javascripts'
set :images_dir, 'assets/images'
set :partials_dir, 'partials'
set :syntax_theme, Rouge::Themes::Github
set :meta, {
  title: 'Learn Swift',
  url: 'http://learn-swift.org',
}

Time.zone = 'Stockholm'

activate :blog do |blog|
  blog.sources = "posts/:year-:month-:day-:title.html"
  blog.permalink = '{year}/{title}.html'
  blog.taglink = "tags/{tag}.html"
  blog.default_extension = ".md"
  blog.paginate = true
  blog.per_page = 10
end

configure :build do
  activate :relative_assets
  activate :directory_indexes
  activate :asset_hash
  activate :minify_html, remove_input_attributes: false
  activate :minify_css
  activate :minify_javascript
  activate :image_optim
  activate :gzip, exts: %w(.js .css .html .htm .svg .ttf .otf .woff .eot)
end

activate :deploy do |deploy|
  deploy.build_before = true
  deploy.method = :git
end

configure :development do
  activate :livereload
end

after_configuration do
  @bower_config = JSON.parse(IO.read("#{root}/.bowerrc"))
  sprockets.append_path File.join "#{root}", @bower_config["directory"]
end
