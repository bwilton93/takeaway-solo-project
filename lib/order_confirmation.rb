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

  def time(time = Time.now)
    @time = time
  end

  def message
    time_now = @time
    future_time = time_now + (30 * 60)
    future_time = future_time.strftime('%H:%M')
    @message = "Thank you! Your order was placed and will be delivered before #{future_time}"
  end

  def send_message(phone_number)
    @twilio_client.messages.create(
      from: '+16205360794',
      to: phone_number,
      body: @message
    )
  end
end
