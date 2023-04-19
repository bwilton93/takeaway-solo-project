require 'order_confirmation'

RSpec.describe OrderConfirmation do
  it "initialises" do
    order_confirmation = OrderConfirmation.new
    expect(order_confirmation.client).to be
  end
end
