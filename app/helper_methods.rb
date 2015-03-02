
# Sorts
def calc_next_reminder
  user_screening = @user.reminders.screening_id.next_reminder
  if user_screening.exist? && user_screening.next_reminder > Date.today
    user_screening.next_reminder
  else
    Date.today + @user.reminders.screenings_id.sort_age(@user.age)
  end
end

def sort_age(user_screenings,age)
	if age.between?(18,24)
		user_screenings.min_18_24
	elsif age.between?(25,29)
		user_screenings.min_25_29
	elsif age.between?(30,39)
		user_screenings.min_30_39
	elsif age.between?(40,49)
		user_screenings.min_40_49
	elsif age.between?(50,59)
		user_screenings.min_50_59
	elsif age.between?(60,69)
		user_screenings.min_60_69
	else
		user_screenings.min_70_up
	end
end

def age
  birthday = self.date_of_birth
  now = Time.now.utc.to_date
  now.year - bday.year - (bday.to_date.change(:year => now.year) > now ? 1 : 0)
end

# def gen_params(user)
# 	arr << sort_gender(user.gender)
# 	arr << sort_age(user.age)
# end

def find_user
  User.find(session[:user_id])
end



def create_user_age(year, month)
	birthday = Date.new(year, month, 1)
  now = Time.now.utc.to_date
  now.year - birthday.year - (birthday.to_date.change(:year => now.year) > now ? 1 : 0)
end

# @user = User.find_by email: params[:email]

##show all conditions/screenings/frequencies

def find_relevent(user_gender)
	user_conditions = self.conditions.screenings.where("gender = ? OR gender = 'all'", user_gender)
end


# Mailgun API helper
def send_email(action, user, session_id)
  mg_client = Mailgun::Client.new ENV['MAILGUN_API_KEY']

  @user = user
  @user_session = session_id
  # Retrieve session user
  # user = find_user

  # Establish default email address for our outbound emails:
  prodminder_sender   = "Prodminder Notifications <notify@prodminder.com>"
  prodminder_subject  = 'Prodminder Notification'

  case action
  when 'notify'
    prodminder_sender = "Prodminder Notifications <notify@prodminder.com>"
    prodminder_subject = 'Prodminder Notification'
  when 'validate_new_user'
    prodminder_sender = "Prodminder Notifications <notify@prodminder.com>"
    prodminder_subject = 'Welcome to Prodminder!'
  when 'announce'
    prodminder_sender = "Prodminder Notifications <notify@prodminder.com>"
    prodminder_subject = 'New message from the Prodminder Team'
  when 'remove'
    prodminder_sender = "Prodminder Notifications <notify@prodminder.com>"
    prodminder_subject = 'Sorry to see you go!'
  end

  message_params ={
    from:      prodminder_sender,
    to:        @user.email,
    subject:   prodminder_subject,
    text:      'It is really easy to send a message!',
    html:      erb(:verify_email)
  }

  # Send the actual email:
  mg_client.send_message "mg.prodminder.com", message_params

end

# Twilio API helper
def send_text(action)
  # Grab Twilio account_sid and auth_token from .env
  account_sid = ENV['TWILIO_ACCOUNT_SID']
  auth_token = ENV['TWILIO_AUTH_TOKEN']

  # Retrieves user session
  user = find_user

  # Connect to Twilio
  @twilio_client = Twilio::REST::Client.new account_sid, auth_token

  # Send text message
  @twilio_client.account.messages.create({
    to: User.phone, # This needs to be sanitized phone number input, i.e. "6041234567"
    from: '+15149002273',
    body: "Twilio API test text" # We'll need to concatenate our SMS message into here
  })
end



# User.where("#{},#{}")

# gen = arr[0]
# age = arr[1]
# Reminder.where("orders_count = ? AND locked = ?", params[:gen], params[:age])

# User.where(:age "min_18_24").where(:age "min_25_29").where(:age "min_30_39")

# User.where("" >= :start_date AND created_at <= :end_date",
#   {start_date: params[:start_date], end_date: params[:end_date]})

#   Reminders = SELECT s.id, s.min_18_24 FROM screenings AS s JOIN reminder AS r WHERE S.id >= 10





