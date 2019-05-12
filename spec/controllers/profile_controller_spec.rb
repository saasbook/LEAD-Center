require 'rails_helper'

RSpec.describe ProfileController, type: :controller do

  describe 'POST update' do
    fixtures :users
    subject { post :update, {:params => { :first_name => 'Bob', :id => 1 }} }

    it 'redirects on update attribute failure' do
      allow_any_instance_of(User).to receive(:update_attributes).and_return(false)
      expect(subject).to redirect_to(edit_profile_path(1))
    end

    it 'flashes alert on failure' do
      allow_any_instance_of(User).to receive(:update_attributes).and_return(false)
      expect(subject).to redirect_to(edit_profile_path(1))
      expect(flash[:alert]).to eq 'There was a problem updating your profile.'
    end
  end
end
