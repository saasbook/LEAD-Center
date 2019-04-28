require 'rails_helper'
require 'webmock/rspec'

RSpec.describe Organization, type: :model do
  context 'validation tests' do
    it 'makes a RESTful API request ' do
      raw_response_file = File.new("tmp/raw_organizations_response.txt")
      stub_request(:any, "https://callink.berkeley.edu/api/Organizations").to_return(:body => raw_response_file.read)
      Organization.get_organizations(nil, nil, nil);
      assert_requested :get, "https://callink.berkeley.edu/api/Organizations", :times => 1
    end
    
    it 'returns an iterable of organizations' do
      raw_response_file = File.new("tmp/raw_organizations_response.txt")
      stub_request(:any, "https://callink.berkeley.edu/api/Organizations").to_return(:body => raw_response_file.read)
      orgs = Organization.get_organizations(nil, nil, nil);
      expect(orgs).to respond_to(:each)
      expect(orgs[0]).to be_instance_of Organization
    end
    
    it 'uses response data from the request' do
      raw_response_file = File.new("tmp/raw_organizations_response.txt")
      stub_request(:any, "https://callink.berkeley.edu/api/Organizations").to_return(:body => raw_response_file.read)
      orgs = Organization.get_organizations(nil, nil, nil);
      expect(orgs[0].id).to eq 0
      expect(orgs[0].name).to eq "Placeholder name"
      expect(orgs[0].description).to eq "Placeholder description"
      expect(orgs[0].imageUrl).to eq "Placeholder image"
    end
  end
end
