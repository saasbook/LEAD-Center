Given /^(?:|I )am on "(.+)"$/ do |page_name|
  if page_name == "landing page"
    visit landing_path
  end
  if page_name == "home page"
    visit root_path
  end
end

Then /I should see a sign in button/ do
  expect(page).to have_button('login-button')
end

Then /I should be redirected to "(.*)"$/ do |page_name|
  if page_name == "landing page"
    current_path.should == landing_path
  end
  if page_name == 'home page'
    current_path.should == root_path
  end
end

And /click sign in button/ do
  click_button('login-button')
end

Given /I am logged in/ do
  visit landing_path
  click_button('login-button')
end

Then /I should see the organizations I am matched with appear 3 at a time/ do
  expect(page).to have_selector('div.slick-active', count: 3)
end
