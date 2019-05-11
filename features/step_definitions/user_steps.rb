Given /the following users exist/ do |users_table|
  users_table.hashes.each do |user|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    users = User.create(user)
    users.save
  end
end

Given /^(?:|I )am on (.+)$/ do |page_name|
  case page_name
  when /^the profile page$/ then visit "/profile/1"
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

When /^(?:|I )press "([^"]*)"$/ do |button|
  click_button(button)
end

When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

When /^(?:|I )select "([^"]*)" from "([^"]*)"$/ do |value, field|
  select(value, :from => field)
end

When /^(?:|I )check "([^"]*)"$/ do |field|
  check(field)
end

Then /I should see "(.*)" before "(.*)"$/ do |e1, e2|
  page.body.include?(e1 + '[/.*/]' + e2)
end

Then /I should see "(.*)" after "(.*)"$/ do |e1, e2|
  page.body.include?(e2 + '[/.*/]' + e1)
end

Then /^(?:|I )should see "([^"]*)"$/ do |e1|
  page.body.include?(e1)
end

Then /^(?:|I )should not see "([^"]*)"$/ do |e1|
  !page.body.include?(e1)
end

Then /^(?:|I )should be on (.+)$/ do |page_name|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == path_to(page_name)
  else
    assert_equal path_to(page_name), current_path
  end
end
