require "../spec_helper"
require "../../src/models/ticket"

describe Ticket do
  it "#generate works!" do
    ApiHelper.mock_create

    ticket = Ticket.from_json(ApiHelper.event_payload)
    generated = ticket.generate
    generated.api_data.not_nil![:apple_pass_url].includes?("http://127.0.0.1:3000/").should be_truthy
    generated.api_data.not_nil![:google_pass_url].includes?("https://pay.google.com/gp/v/save").should be_truthy
  end
end
