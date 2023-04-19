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
end
