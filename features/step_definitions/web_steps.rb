Given /the following questions exist/ do |questions_table|
  questions_table.hashes.each do |question|
    Question.create(
      title: question['title'],
      options: eval(question['options']),
      next_question: eval(question['next_question']),
      can_skip: question['can_skip']
    )
  end
end

Then /(.*) seed questions should exist/ do |n_seeds|
  Question.count.should be n_seeds.to_i
end

Given /^(?:|I )am on "(.+)"$/ do |page_name|
  if page_name == "landing page"
    visit landing_path
  end
  if page_name == "home page"
    visit root_path
  end
end

Then /I should see a sign in button/ do
  expect(find_button("login-button").value).to eq("Placeholder Login")
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

Given /I am not logged in/ do
  visit landing_path
end

Then /I should see the organizations I am matched with appear 3 at a time/ do
  expect(page).to have_selector('div.slick-active', count: 3)
end

Then /I should see a "(.*)" button/ do |name|
  expect(find_button('start-quiz-btn').value).to eq(name)
end

When /I (do not )?click the "Start" button/ do |dont_click|
  click_button('start-quiz-btn') unless dont_click
end

Then /I should (not )?see the quiz modal/ do |not_see|
  expect(find('#quiz-modal')['class']).to include('show') unless not_see
end

When /I repeatedly answer questions/ do
  sleep 3
  choose('selected_option', wait: 3, :match => :first)
  click_button('submit-response-btn')
  sleep 3 # Sleep for 3 seconds wait for next question to load
  choose('selected_option', wait: 3, :match => :first)
  click_button('submit-response-btn')
end

Then /I should see a finished quiz page/ do
  find('button.btn-finish-quiz').text.should eq('See Orgs')
end

Then /I should not see a "Start" button/ do
  page.should have_no_content('Start')
end