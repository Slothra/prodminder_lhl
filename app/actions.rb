get '/' do
  slim :index
end

get '/user' do
	slim :user
	#login for returning user
end

get '/user/new' do
	slim :'user/new'
	#create new user
end

get '/user/validate' do
	slim :'user/validate'
	#message email sent, use the link
end

get '/condition/:id' do
	#puts condition info/source
end

get 'user/:id/account' do
	#main dashboard
end


post '/new' do
	#sends email
	# valid email/info
	if #valid
		redirect '/user/validate'
	else
		#error message
		slim :'user/new'
end

post '/account' do
	#send email
	redirect '/user/validate'
end

get '/privacy-policy' do

end

get '/about' do
end

get '/disclaimer' do
end

delete '/account' do
end

get '/stylesheets/:name.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass(:"stylesheets/#{params[:name]}", Compass.sass_engine_options )
end

get '/dashboard' do
  slim :dashboard

end

not_found do
  redirect '/404.html'
end
