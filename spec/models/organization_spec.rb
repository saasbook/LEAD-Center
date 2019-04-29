require 'rails_helper'
require 'webmock/rspec'

RSpec.describe Organization, type: :model do
  context 'validation tests' do
    it 'makes a RESTful API request ' do
      raw_response_file1 = File.new("spec/response/raw_organizations_response_page1.txt")
      raw_response_file2 = File.new("spec/response/raw_organizations_response_page2.txt")
      stub_request(:any, "https://callink.berkeley.edu/api/Organizations?page=1").to_return(:body => raw_response_file1.read)
      stub_request(:any, "https://callink.berkeley.edu/api/Organizations?page=2").to_return(:body => raw_response_file2.read)
      Organization.get_organizations(3, nil, nil);
      assert_requested :get, "https://callink.berkeley.edu/api/Organizations?page=1", :times => 1
      assert_requested :get, "https://callink.berkeley.edu/api/Organizations?page=2", :times => 1
    end

    it 'returns an iterable of organizations' do
      raw_response_file1 = File.new("spec/response/raw_organizations_response_page1.txt")
      raw_response_file2 = File.new("spec/response/raw_organizations_response_page2.txt")
      stub_request(:any, "https://callink.berkeley.edu/api/Organizations?page=1").to_return(:body => raw_response_file1.read)
      stub_request(:any, "https://callink.berkeley.edu/api/Organizations?page=2").to_return(:body => raw_response_file2.read)
      orgs = Organization.get_organizations(3, nil, nil);
      expect(orgs).to respond_to(:each)
      expect(orgs[0]).to be_instance_of Organization
    end

    it 'uses response data from the request' do
      raw_response_file1 = File.new("spec/response/raw_organizations_response_page1.txt")
      raw_response_file2 = File.new("spec/response/raw_organizations_response_page2.txt")
      stub_request(:any, "https://callink.berkeley.edu/api/Organizations?page=1").to_return(:body => raw_response_file1.read)
      stub_request(:any, "https://callink.berkeley.edu/api/Organizations?page=2").to_return(:body => raw_response_file2.read)
      orgs = Organization.get_organizations(3, nil, nil);
      expect(orgs[0].id).to eq 0
      expect(orgs[0].name).to eq "Placeholder name"
      expect(orgs[0].description).to eq "Placeholder description"
      expect(orgs[0].imageUrl).to eq "Placeholder image"
    end

    it 'only retrieve orgs of given categories' do
      raw_response_file1 = File.new("spec/response/raw_organizations_response_page1.txt")
      raw_response_file2 = File.new("spec/response/raw_organizations_response_page2.txt")
      stub_request(:any, "https://callink.berkeley.edu/api/Organizations?page=1").to_return(:body => raw_response_file1.read)
      stub_request(:any, "https://callink.berkeley.edu/api/Organizations?page=2").to_return(:body => raw_response_file2.read)
      orgs = Organization.get_organizations(3, ["academic","social"], nil);
      expect(orgs[0].id).to eq 0
      expect(orgs.length).to eq 3
    end

    it 'sorts results by the interest matched' do
      raw_response_file1 = File.new("spec/response/raw_organizations_response_page1.txt")
      raw_response_file2 = File.new("spec/response/raw_organizations_response_page2.txt")
      stub_request(:any, "https://callink.berkeley.edu/api/Organizations?page=1").to_return(:body => raw_response_file1.read)
      stub_request(:any, "https://callink.berkeley.edu/api/Organizations?page=2").to_return(:body => raw_response_file2.read)
      orgs = Organization.get_organizations(3, ["academic","social"], ["advocacy","community service","food"]);
      expect(orgs[0].id).to eq 1
      expect(orgs[1].id).to eq 2
      expect(orgs[2].id).to eq 0
      expect(orgs.length).to eq 3
    end
  end
end
