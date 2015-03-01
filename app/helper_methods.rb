
Sorts
def sort_gender(gender)
	if gender == "M"
		10
	else
		11
	end
end

def sort_age(@user.age)
	case age
	when 18 <= age && age <= 24
		"min_18_24"
	when 25 <= age && age <= 29
		"min_25_29"
	when 30 <= age && age <= 39
		"min_30_39"
	when 40 <= age && age <= 49
		"min_40_49"
	when 50 <= age && age <= 59
		"min_50_59"
	when 60 <= age && age <= 69
		"min_60_69"
	when 70 <= age
		"min_70_up"
	else
		"You must be 18 or older to use this service"
	end
end

def gen_params(user)
	arr << sort_gender(user.gender)
	arr << sort_age(user.age)
end


@user = User.new(
	age: create_user_age(params[:year],params[:month])
	gender: params[:gender]
	email: params[:email]
	phone: params[:phone]
)
@user.save

def create_user_age(year, month)
	birthday = date.new(year, month, 1)
  now = Time.now.utc.to_date
  now.year - birthday.year - (birthday.to_date.change(:year => now.year) > now ? 1 : 0)
end

@user = User.find_by email: params[:email]

##show all conditions/screenings/frequencies

def find_relevent(age,user_gender)
	user_conditions = @user.conditions.screenings.where("gender = ? OR gender = 'all'", user_gender)
end


# Mailgun API helper
def send_email(action)
  mg_client = Mailgun::Client.new ENV['MAILGUN_API_KEY']

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
  
  data = Multimap.new
  data[:from] = prodminder_sender
  data[:to] = User.email
  data[:subject] = prodminder_subject
  data[:text] = "We haven't built the email body case statement yet."
  data[:html] = "<html>HTML version of the body will go here.</html>"
  
  # Send the actual email:
  mg_client.send_message "mg.prodminder.com", data
	
end

# Twilio API helper
def send_text(action)
  # Grab Twilio account_sid and auth_token from .env
  account_sid = ENV['TWILIO_ACCOUNT_SID']
  auth_token = ENV['TWILIO_AUTH_TOKEN']

  # Connect to Twilio
  @twilio_client = Twilio::REST::Client.new account_sid, auth_token

  # Send text message
  @twilio_client.account.messages.create({
    :to   => User.phone, # This needs to be sanitized phone number input, i.e. "6041234567"
    :from => '+15149002273'
    :body => "Twilio API test text" # We'll need to concatenate our SMS message into here
  })
end



User.where("#{},#{}")

gen = arr[0]
age = arr[1]
Reminder.where("orders_count = ? AND locked = ?", params[:gen], params[:age])

User.where(:age "min_18_24").where(:age "min_25_29").where(:age "min_30_39")

User.where("" >= :start_date AND created_at <= :end_date",
  {start_date: params[:start_date], end_date: params[:end_date]})

  Reminders = SELECT s.id, s.min_18_24 FROM screenings AS s JOIN reminder AS r WHERE S.id >= 10





