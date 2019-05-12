require 'rails_helper'

RSpec.describe ProfileController, type: :controller do

  before do
    @user = User.create(:last_name => 'James')
    session[:user_id] = @user.id
  end

  describe 'POST update' do

    fixtures :users
    subject { post :update, {:params => { :first_name => 'Bob', :id => @user.id }} }

    it 'redirects on update attribute failure' do
      allow_any_instance_of(User).to receive(:update_attributes).and_return(false)
      expect(subject).to redirect_to(edit_profile_path(@user.id))
    end

    it 'flashes alert on failure' do
      allow_any_instance_of(User).to receive(:update_attributes).and_return(false)
      expect(subject).to redirect_to(edit_profile_path(@user.id))
      expect(flash[:alert]).to eq 'There was a problem updating your profile.'
    end
  end
end
