require 'rubygems'
require 'bundler'
Bundler.require :default

PDFKit.configure do |config|
  config.wkhtmltopdf = '/usr/local/bin/wkhtmltopdf'
  config.default_options = {
    'margin-top' => 0,
    'margin-bottom' => 0,
    'margin-left' => 0,
    'margin-right' => 0
  }
end

get '/pdf' do
  if params[:url]
    content_type 'application/pdf'
    url = params[:url] =~ /^http:\/\// ? params[:url] : "http://#{params[:url]}"
    kit = PDFKit.new url
    kit.to_pdf
  else
    'specify url param'
  end
end

get '/' do
  'O_o'
end
