require 'rails_helper'
require 'webmock/rspec'

RSpec.describe Organization, type: :model do
  context 'validation tests' do
    url = "https://callink.berkeley.edu/api/Organizations"
    before :each do
      raw_response_file1 = File.new("spec/response/raw_organizations_response_page1.txt")
      raw_response_file2 = File.new("spec/response/raw_organizations_response_page2.txt")
      stub_request(:any, url).with(:query => { :page => 1, :key => Figaro.env.callink_key, :type => 'Registered Student Organizations', :status => 'Active'}).to_return(:body => raw_response_file1.read)
      stub_request(:any, url).with(:query => { :page => 2, :key => Figaro.env.callink_key, :type => 'Registered Student Organizations', :status => 'Active'}).to_return(:body => raw_response_file2.read)
      interest_file = File.new('spec/response/fake_interest.csv')
      allow(File).to receive(:read).and_call_original
      allow(File).to receive(:read).with('lib/interest.csv').and_return(interest_file.read)
    end

    it 'makes a RESTful API request ' do
      Organization.get_organizations(3, ["academic","social"], nil);
      WebMock.should have_requested(:get , url).with(:query => { :page => 1, :key => Figaro.env.callink_key, :type => 'Registered Student Organizations', :status => 'Active' })
      WebMock.should have_requested(:get , url).with(:query => { :page => 2, :key => Figaro.env.callink_key, :type => 'Registered Student Organizations', :status => 'Active' })
    end

    it 'returns an iterable of organizations' do
      orgs = Organization.get_organizations(3, ["academic","social"], nil);
      expect(orgs).to respond_to(:each)
      expect(orgs[0]).to be_instance_of Organization
    end

    it 'uses response data from the request' do
      orgs = Organization.get_organizations(3, ["social"], nil);
      expect(orgs[0].id).to eq 2
      expect(orgs[0].name).to eq "Foodies"
      expect(orgs[0].description).to eq "Placeholder description"
      expect(orgs[0].imageUrl).to eq "Placeholder image"
    end

    it 'only retrieve orgs of given categories' do
      orgs = Organization.get_organizations(3, ["academic","social"], nil);
      expect(orgs[0].id).to eq 0
      expect(orgs.length).to eq 3
    end

     it 'sorts results by the interest matched' do
       orgs = Organization.get_organizations(3, ["academic","social"], ["advocacy","community service","food"]);
       expect(orgs[0].id).to eq 1
       expect(orgs[1].id).to eq 2
       expect(orgs[2].id).to eq 0
       expect(orgs.length).to eq 3
     end

     it 'sorts even if org is not listed in interests' do
       orgs = Organization.get_organizations(4, ["academic","social"], ["advocacy","community service","food"]);
       expect(orgs[0].id).to eq 1
       expect(orgs[1].id).to eq 2
       expect(orgs[2].id).to eq 0
       expect(orgs[3].id).to eq 5
       expect(orgs.length).to eq 4
     end
  end

end
