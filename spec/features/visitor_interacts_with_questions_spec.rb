require 'rails_helper'

feature "View All Questions", %(
  As a user
  I want to view recently posted questions
  So that I can help others

  Acceptance Criteria
  [X] I must see the title of each question
  [X] I must see questions listed in order, most recently posted first
) do

  scenario "Navigate to questions from root" do
    question = FactoryGirl.create(:question)
    visit '/'

    expect(page).to have_content(question.title)
  end

end

feature "View a Question's Details", %(
  As a user
  I want to view a question's details
  So that I can effectively understand the question

  Acceptance Criteria
  [X] I must be able to get to this page from the questions index
  [X] I must see the question's title
  [X] I must see the question's description
) do

  scenario "Click on first question" do
    question = FactoryGirl.create(:question)
    visit '/'
    click_link question.title

    expect(page).to have_content(question.title)
    expect(page).to have_content(question.description)
    expect(current_path).to eq(question_path(question))
  end
end

feature "Post a question" do
  scenario "Valid Question", %(
    As a user
    I want to post a question
    So that I can receive help from others

    Acceptance Criteria
    [X] I must provide a title that is at least 40 characters long
    [X] I must provide a description that is at least 150 characters long
  ) do
    question = FactoryGirl.build(:question)

    visit '/'
    click_link "Ask a Question"
    fill_in("Title", with: question.title)
    fill_in("Description", with: question.description)
    click_button "Submit Question"

    expect(page).to have_content(question.title)
    expect(page).to have_content(question.description)
    expect(page).to have_content("Question submitted!")
  end

  scenario "Invalid Question", %(
    [X] I must be presented with errors if I fill out the form incorrectly
    ) do
      visit '/'
      click_link "Ask a Question"
      fill_in("Title", with: "Fish")
      click_button "Submit Question"

      expect(page).to have_content "Invalid input"
    end
end

feature "Answering a Question" do
  scenario "valid answer", %(
    As a user
    I want to answer another user's question
    So that I can help them solve their problem

    Acceptance Criteria
    [X] I must be on the question detail page
    [X] I must provide a description that is at least 50 characters long
  ) do
    question = FactoryGirl.create(:question)
    answer = FactoryGirl.build(:answer)
    visit '/'
    click_link question.title
    fill_in("Explanation", with: answer.description)
    click_button "Add Answer"

    expect(page).to have_content(question.title)
    expect(page).to have_content(question.description)
    expect(page).to have_content(answer.description)
  end


  scenario "Incorrectly filling out answer form", %(
    [X] I must be presented with errors if I fill out the form incorrectly
    ) do
      question = FactoryGirl.create(:question)
      visit '/'
      click_link question.title
      click_button "Add Answer"

      expect(page).to have_content "Invalid input"
    end
end

feature "Editing a Question" do
  scenario "valid information", %(
    As a user
    I want to edit a question
    So that I can correct any mistakes or add updates

    Acceptance Criteria
    [X] I must provide valid information
    [X] I must be able to get to the edit page from the question details page

  ) do
    question = FactoryGirl.create(:question)
    edited_info = FactoryGirl.build(:question)
    visit '/'
    click_link question.title
    click_link "Edit Question"
    fill_in("Description", with: edited_info.description)

    click_button "Submit Question"

    expect(page).to have_content(question.title)
    expect(page).to have_content(edited_info.description)
  end

  scenario "not valid information", %(
    [X] I must be presented with errors if I fill out the form incorrectly
  ) do
    question = FactoryGirl.create(:question)
    visit '/'
    click_link question.title
    click_link "Edit Question"
    fill_in("Title", with: "Fish")
    click_button "Submit Question"

    expect(page).to have_content "Invalid input"
  end

end

feature "Viewing a Question's Answers" do

  scenario "look at a question", %(
    As a user
    I want to view the answers for a question
    So that I can learn from the answer

    Acceptance Criteria
    [X] I must be on the question detail page
    [X] I must only see answers to the question I'm viewing
    [X] I must see all answers listed in order, most recent last
  ) do
    question = FactoryGirl.create(:question)
    answers = []
    5.times do
      answer = FactoryGirl.build(:answer)
      answer.question_id = question.id
      answer.save
      answers << answer
    end
    other_answer = Answer.create(question_id: 300, description: "Fruitcake apple pie muffin cupcake lollipop croissant wafer carrot cake powder. Jelly soufflé candy chocolate cake tootsie roll tiramisu sweet roll gummi bears topping. Chupa chups pudding chocolate ice cream brownie biscuit cookie cotton candy.")


    visit '/'
    click_link question.title

    expect(page).to have_content(answers[0].description)
    expect(page).to have_content(answers[1].description)
    expect(page).to have_content(answers[2].description)
    expect(page).to have_content(answers[3].description)
    expect(page).to have_content(answers[4].description)
    expect(page).to_not have_content(other_answer.description)
    expect(current_path).to eq(question_path(question))
  end

end

feature "Deleting a Question", %(
  As a user
  I want to delete a question
  So that I can delete duplicate questions
) do

  scenario "delete from edit page", %(
    [X] I must be able delete a question from the question edit page
  ) do
    question = FactoryGirl.create(:question)
    visit edit_question_path(question)
    click_link "Delete"

    expect(current_path).to eq(questions_path)
    expect(page).to_not have_content(question.title)

  end

  scenario "delete from details page", %(
    [X] I must be able delete a question from the question details page
  ) do
    question = FactoryGirl.create(:question)
    visit question_path(question)
    click_link "Delete"

    expect(current_path).to eq(questions_path)
    expect(page).to_not have_content(question.title)
  end

  scenario "check that answers are also deleted", %(
    [X] All answers associated with the question must also be deleted
  ) do
    question = FactoryGirl.create(:question)
    answers = []
    5.times do
      answer = FactoryGirl.build(:answer)
      answer.question_id = question.id
      answers << answer.save
    end

    visit question_path(question)
    click_link "Delete"

    expect(Answer.where(question: question)).to be_empty
  end

end
