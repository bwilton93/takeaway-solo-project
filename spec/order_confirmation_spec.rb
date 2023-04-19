require 'order_confirmation'

RSpec.describe OrderConfirmation do
  it "initialises" do
    order_confirmation = OrderConfirmation.new
    expect(order_confirmation.client).to be
  end

  it "generates the correct message to be sent" do
    order_confirmation = OrderConfirmation.new
    time = Time.new(2023, 4, 19, 14, 54, 48)
    order_confirmation.time(time)
    expect(order_confirmation.message).to eq "Thank you! Your order was placed and will be delivered before 15:24"
  end

  it "generates the correct time to be sent" do
    order_confirmation = OrderConfirmation.new
    time = Time.now
    order_confirmation.time(time)
    expect(order_confirmation.message).to eq "Thank you! Your order was placed and will be delivered before #{(time + (30 * 60)).strftime('%H:%M')}"
  end
end
