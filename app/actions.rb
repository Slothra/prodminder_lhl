#--------------------------------------
# NOTE:
# DON'T ADD TRAILING SLASHES TO PATHS
#--------------------------------------
@dev_mode = true

get '/' do
  slim :index , locals: { body_class: "index" }
end

get '/policies-and-about' do
  slim :policies_and_about , locals: { body_class: "policies" }
end

# App home
get '/dashboard' do
  # @current_user_logged_in = false

  if @current_user_logged_in
    # -- User has not logged in yet
    @conditions = Condition.all
    # @screenings = Screening.all
  else

    # TODO -- User is logged in and returning to app
    # Return User personalize active screenings and conditions
    @conditions = Condition.all
    @screenings = Condition.all

  end

  slim :dashboard, locals: { body_class: "app dashboard" }
end

# User login
get '/login' do
  slim :login, locals: { body_class: "login"}

  @current_user_logged_in = true
end

get '/logout' do
  if @current_user_logged_in
   # TODO
   # clear current user session
     @current_user_logged_in = false
  end
  redirect '/'
end

# User email validate
get '/dashboard/validate' do
  if @current_user_logged_in
    # current user trying to re-validate email--why?
    redirect "/dashboard"
  end

  # TODO
  # Custom generated url something like this
  # get '/user/:id/:private_session/validate' do
  # redirect "/dashboard"

  slim :dashboard_email_validate, locals: { body_class: "app email-validate" }
end

# Post end point for user creation
post '/user/create' do
  if @current_user_logged_in
    # current user tryig to POST new user--why?
    redirect "/"
  end
  # TODO
  # We need to do something with age before we
  # put it into the database
  #
  # age = params[:dob]
  #
  # user = User.new(
  #   email: params[:email],
  #   phone: params[:phone],
  #   age: params[:dob],
  #   gender: params[:gender]
  # )
  # user.save
  # @current_user_logged_in = true
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

#--------------------------------------
# Screening Reminders
#--------------------------------------
post '/user/:id/condition/:screening_id' do
  reminder = Reminder.new(
    user_id: @user.id,
    screening_id: @user.conditions.screenings.id,
    last_reminder: Date.today,
    next_reminder: calc_next_reminder
  )
  reminder.save
end

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
