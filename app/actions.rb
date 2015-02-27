get '/' do
  slim :index , locals: { body_class: "index" }
end

get '/stylesheets/:name.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass(:"stylesheets/#{params[:name]}", Compass.sass_engine_options )
end

# App home
get '/dashboard' do
  slim :dashboard, locals: { body_class: "app dashboard" }
end

# 404
not_found do
  redirect '/404.html'
  slim :index , locals: { body_class: "index"}
end

#login for returning user
get '/user' do
  slim :user
end

#create new user
get '/user/new' do
  slim :'user/new'
end

#message email sent, use the link
get '/user/validate' do
  slim :'user/validate'
end

#puts condition info/source
get '/condition/:id' do
end

#main dashboard
get 'user/:id/account' do
end

get '/login' do
  slim :login, locals: { body_class: "login"}
end

#sends email
post '/new' do
  # valid email/info
  if #valid
    redirect '/user/validate'
  else
    slim :'user/new'
  end
end

#send email
post '/account' do
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
