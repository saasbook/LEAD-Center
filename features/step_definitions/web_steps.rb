Given /the following questions exist/ do |questions_table|
  questions_table.hashes.each do |question|
    Question.create(
      title: question['title'],
      options: eval(question['options']),
      next_question: eval(question['next_question']),
      question_type: question['question_type']
    )
  end
end

Then /(.*) seed questions should exist/ do |n_seeds|
  Question.count.should be n_seeds.to_i
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
  if page_name == "calnet page"
    current_path.should == '/cas/login'
  end
  if page_name == "profile page"
    current_path.should == '/profile/1/edit'
  end
end

And /click sign in button/ do
  click_button('login-button')
end

And /click log in button/ do
 
  click_button('submit')
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
  sleep 3
  expect(find('#quiz-modal')['class']).to include('show') unless not_see
end

When /I repeatedly answer questions/ do
  sleep 2 # Sleeps are necessary here to allow for CSS transition times
  while page.has_button?('submit-response-btn') do
    check('selected_options_', wait: 3, :match => :first)
    click_button('submit-response-btn')
    sleep 2
  end
end

Then /I should see a finished quiz page/ do
  expect(page).to have_link('finish-quiz')
end

Then /I should not see a "Start" button/ do
  page.should have_no_content('Start')
end

Then /I should see my matched organizations/ do
  expect(page).to have_text(:all, "Foodies")
end

Given /I have taken a quiz/ do
  Question.create(
    title: "Foo",
    options: { "Bar" => "Baz"},
    next_question: { "Bar" => "Baz"},
    question_type: "category"
  )
  qq = Quiz.create(current_question: 1)
  responses_params = {
    :question_id => 1,
    :content => ['social'],
    :quiz_id => qq.id,
    :is_category => true
  }
  response = Response.create(responses_params)
end