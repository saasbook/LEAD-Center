require "rack_session_access/capybara"

Given /the following users exist/ do |users_table|
  users_table.hashes.each do |user|
    # Should be part of the new profile change
    user[:ethnicity] = user[:ethnicity].split(/,/)
    users = User.create(user)
    users.save
  end
end

Given /^(?:|I )am on (.+)$/ do |page_name|
  case page_name
  when /^the profile page$/ 
    # We must use middleware to inject a proper session user_id, or else the page will fail authentication.
    page.set_rack_session(:user_id => 1)
    visit "/profile/1"
  when /^the edit page$/ then visit "profile/1/edit"
  when /^"landing page"$/ then visit landing_path
  when /^"home page"$/ then visit root_path
  when /^the updated home page with quiz results$/
    url = "https://callink.berkeley.edu/api/Organizations"
    raw_response_file1 = File.new("spec/response/raw_organizations_response.txt")
    stub_request(:any, url).with(:query => { :page => 1, :key => Figaro.env.callink_key }).to_return(:body => raw_response_file1.read)
    visit "/generate_orgs?quiz_id=1"
  end
end

Given /I have logged in to the interests upload page/ do
	# Stub out the basic auth; not very compatible with cucumber, and we already test this in rspec
	allow_any_instance_of(InterestsController).to receive(:http_authenticate) do |arg|
	end
	visit interests_path
end

When /I upload a file/ do
  # Stub out the file write, just in case it overwrites something
  allow_any_instance_of(InterestsController).to receive(:save_csv) do |arg|
  end
  attach_file('csv_file', "#{Rails.root}/spec/fixtures/dummy.csv")
  click_button("Upload")
end

Given /^(?:|I )see "([^"]*)"$/ do |e1|
  expect(page.body.include?(e1)).to be(true)
end

When /^(?:|I )press "([^"]*)"( link)?$/ do |content, is_link|
  is_link ? click_link(content) : click_button(content)
end

When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

When /^(?:|I )select "([^"]*)" from "([^"]*)"$/ do |value, field|
  select(value, :from => field)
end

When /^(?:|I )check "([^"]*)"$/ do |field|
  find("label[for='#{field}']").click
end

Then /I should see "(.*)" before "(.*)"$/ do |e1, e2|
  expect(page.body.match?(/.*#{e1}.*#{e2}.*/m)).to be(true)
end

Then /I should see "(.*)" after "(.*)"$/ do |e1, e2|
  expect(page.body.match?(/.*#{e2}.*#{e1}.*/m)).to be(true)
end

Then /^(?:|I )should see "([^"]*)"$/ do |e1|
  expect(page.body.include?(e1)).to be(true)
end

Then /^(?:|I )should not see "([^"]*)"$/ do |e1|
  expect(!page.body.include?(e1)).to be(true)
end

Then /^(?:|I )should be on (.+)$/ do |page_name|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == path_to(page_name)
  else
    assert_equal path_to(page_name), current_path
  end
end

