require 'rubygems'
require 'bundler'
Bundler.require :default

get '/pdf' do
  content_type 'application/pdf'
  kit = PDFKit.new 'http://google.com/' #params[:url]
  kit.to_pdf
end
