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

get '/err' do
	erb :err
end

get '/visit' do
	erb :visit
end

post '/visit' do
	erb :visit
	@username = params[:username]
	@phone = params[:phone]
	@datetime = params[:datetime]
	@barber = params[:barber]
	f = File.open './public/users.txt','a'
	f.write "User: #{@username}, phone #{@phone}, date & time #{@datetime}, #{@barber}\n"
	erb :visit
end 

get '/contacts' do
	erb :contacts
end

post '/contacts' do
	erb :contacts
	@email = params[:email]
	@message = params[:message]
	flag = @email.include? "@"
	if flag == true 
		f1 = File.open './public/contacts.txt','a'
		f1.write "E-mail: #{@email}, Text #{@message}\n"
	end

	erb :contacts
end 
