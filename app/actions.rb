#--------------------------------------
# NOTE:
# DON'T ADD TRAILING SLASHES TO PATHS
#--------------------------------------

get '/' do
  slim :index , locals: { body_class: "index" }
end

# App home
get '/dashboard' do
	@screenings = Screening.all
	@conditions = Condition.all
  slim :dashboard, locals: { body_class: "app dashboard" }
end

# User login
get '/login' do
  slim :login, locals: { body_class: "login"}
end

get '/logout' do
  redirect '/'
end

# User email validate
get '/dashboard/validate' do
  slim :dashboard_email_validate, locals: { body_class: "app email-validate" }
end

# Post end point for user creation
post '/user/create' do
  # NOTE: We need to do something with age before we put it into the database

  # age = params[:dob]

  # user = User.new(
  #   email: params[:email],
  #   phone: params[:phone],
  #   age: params[:dob],
  #   gender: params[:gender]
  # )
  # user.save
end

#--------------------------------------
# Static Files
#--------------------------------------
get '/stylesheets/:name.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass(:"stylesheets/#{params[:name]}", Compass.sass_engine_options )
end

#--------------------------------------
# 404
#--------------------------------------
not_found do
  status '404'
  slim :x404 , locals: { body_class: "x404"}
end

# login for returning user
# get '/user' do
#   slim :user
# end

# create new user
# get '/user/new' do
#   slim :'user/new'
# end

#puts condition info/source
# get '/condition/:id' do
# end

#main dashboard
# get 'user/:id/account' do
# end

#sends email
# post '/new' do
#   # valid email/info
#   if #valid
#     redirect '/user/validate'
#   else
#     slim :'user/new'
#   end
# end

#send email
# post '/account' do
#   redirect '/user/validate'
# end

# get '/privacy-policy' do
# end

# get '/about' do
# end

# get '/disclaimer' do
# end

# delete '/account' do
# end
