require_relative 'helper_methods'
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

  if set_find_user(session[:current_user_custom_id])
    # NOTE -- User is logged in

    # Gender check
    if @user.gender.downcase == "male"
      @conditions = Condition.where('id >= 3')
    else
      @conditions = Condition.all
    end

    # Reminder
    @enabled_cards = []
    @user.reminders.each do |reminder|
      @enabled_cards << reminder.screening_id
    end

    # Age check
    @age = @user.age

  else
    # NOTE -- User is not logged in
    @conditions = Condition.all

    # Set age
    @age = 30
  end

  slim :dashboard, locals: { body_class: "app dashboard" }
end

# User login
get '/login' do
  slim :login, locals: { body_class: "login"}
end

get '/logout' do
  reset_session
  redirect '/'
end

get '/user/:custom_id/verify/:custom_session_id' do
  @user = User.find_by(custom_id: params[:custom_id])
  @user.activated_on = Time.now
  @user.save
  session[:current_user_custom_id] = @user.custom_id

  redirect '/dashboard/validate'
end

# User email validate
get '/dashboard/validate' do
  set_find_user(session[:current_user_custom_id])

  slim :dashboard_email_validate, locals: { body_class: "app email-validate" }
end

# Post end point for user creation
post '/user/create' do
  # if @current_user_logged_in
    # current user tryig to POST new user--why?
    # redirect "/"
  # end

  # Take web form month/date and convert to date object
  user_age = params[:age]
  today = Date.today.day
  today.to_s
  age = "#{user_age}-#{today}"

  user = User.new(
    email: params[:email],
    phone: params[:phone],
    gender: params[:gender],
    custom_id: SecureRandom.hex(12),
    date_of_birth: age.to_date
  )
  user.save

  user_session = Session.new(
    user_id: user.custom_id,
    custom_session_id: SecureRandom.urlsafe_base64
  )
  user_session.save

  # Create reminder for each screening_id
  if !params[:screening_id].nil?
    if params[:screening_id].length > 0

      params[:screening_id].each do |index|
        current = Reminder.new(screening_id: index, user_id: user.id, last_reminder: Date.today)
        current.next_reminder = current.last_reminder + sort_age(Screening.find(index), user.age).days
        current.save
      end

    end
  end

  send_email("validate_new_user", user, user_session.custom_session_id)
end

post '/user/:id/validate/:session_id' do
  @current_user_logged_in = true
  user = User.find(session[:user_id])
end

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
