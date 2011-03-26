require 'rubygems'
require 'bundler'
Bundler.require :default

get '/pdf' do
  PDFKit.configure do |config|
    config.wkhtmltopdf = '/usr/local/bin/wkhtmltopdf'
    config.default_options = {
    }
  end
  content_type 'application/pdf'
  url = params[:url] =~ /^http:\/\// ? params[:url] : "http://#{params[:url]}"
  kit = PDFKit.new url
  kit.to_pdf
end
