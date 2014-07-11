require "spec_helper"

describe Lita::Handlers::GitlabCi, lita_handler: true do

  http_route_path = '/lita/gitlab-ci'

  it "registers with Lita" do
    expect(Lita.handlers).to include(described_class)
  end

  it "registers HTTP route POST #{http_route_path} to :webhook" do
    routes_http(:post, http_route_path).to(:webhook)
  end

  let(:request) { double('Rack::Request') }
  let(:response) { Rack::Response.new }

  describe "#webhook" do
    let(:webhook_data) { fixture_file('webhook') }
    let(:build_message) { "Brightbox / Brightbox Cli (master) build on 2014-05-05 18:01:02 UTC and failed." }
    before do
      allow(request).to receive(:body).and_return(webhook_data)
    end

    it "should notifies user to new build status" do
      expect(robot).to receive(:send_message) do |target, message|
        expect(message).to eq build_message
      end

      subject.webhook(request, response)
    end


  end
end
