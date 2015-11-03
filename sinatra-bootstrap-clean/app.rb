#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>!!!"			
end

get '/about' do
	erb :about
end

get '/visit' do
	erb :visit
end

post '/visit' do
	erb :visit
	@username = params[:username]
	@phone = params[:phone]
	@datetime = params[:datetime]
	f = File.open './public/users.txt','a'
	f.write "User: #{@username}, phone #{@phone}, date & time #{@datetime}\n"
	erb :visit
end 

get '/contacts' do
	erb :contacts
end

post '/contacts' do
	erb :contacts
	@email = params[:email]
	@message = params[:message]
	f = File.open './public/contacts.txt','a'
	f.write "E-mail: #{@email}, Text #{@message}\n"
	erb :contacts
end 
