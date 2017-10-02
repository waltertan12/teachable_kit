require 'spec_helper'

RSpec.describe TeachableKit::Client do
  subject(:client) { TeachableKit::Client.new }

  describe "#method_missing" do
    context "called with an existing method" do
      it { expect { client.users }.to_not raise_error }
    end

    context "called with a missing method" do
      it { expect { client.this_is_wrong }.to raise_error(NoMethodError) }
    end
  end

  describe '#connection' do
    it 'sets the content type header' do
      expect(client.connection.headers['Content-Type']).to eq("application/json")
    end

    it 'sets the accept header' do
      expect(client.connection.headers['Accept']).to eq("application/json")
    end
  end
end
