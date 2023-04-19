require 'twilio-ruby'

class OrderConfirmation
  # obtaining current time
  # adding arbitrary value to time
  # sends text message saying order will arrive
  def initialize
    @account_sid = ENV["TWILIO_ACCOUNT_SID"]
    @account_auth = ENV["TWILIO_AUTH_TOKEN"]
    @twilio_client = Twilio::REST::Client.new(@account_sid, @account_auth)
  end

  def client
    return @twilio_client
  end

  def time
    @time = Time.now 
  end

  def send_message(phone_number)
    time_now = time
    @twilio_client.messages.create(
      from: '+16205360794',
      to: phone_number,
      body: "Thank you! Your order was placed and will be delivered before #{time_now + (30 * 60)}"
    )
  end
end

p Time.now + (20 * 60)