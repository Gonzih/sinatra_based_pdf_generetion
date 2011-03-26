require 'rubygems'
require 'bundler'
Bundler.require :default

get '/pdf' do
  content_type 'application/pdf'
  url = params[:url] =~ /^http:\/\// ? params[:url] : "http://#{params[:url]}"
  kit = PDFKit.new url
  kit.to_pdf
end
