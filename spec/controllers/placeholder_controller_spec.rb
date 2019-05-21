require 'rails_helper'

RSpec.describe PlaceholderController, type: :controller do

  describe 'GET generate_orgs' do
    fixtures :all

    it 'checks for flash when organizations are nil' do
      Organization.stub(:get_organizations).and_return(nil)
      get :generate_orgs, format: :js, xhr: true, params: { :quiz_id => 1 }
      expect(flash[:alert]).to eq 'There was a problem matching with organizations.'
    end
  end
end
