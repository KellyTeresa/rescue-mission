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
    # add this back when styling is working
    # expect(page).to have_content("Question submitted!")
  end

  pending "Invalid Question", %(
    [ ] I must be presented with errors if I fill out the form incorrectly
    )
    # add this when styling is working
end

feature "Answering a Question" do
  pending "valid answer", %(
    As a user
    I want to answer another user's question
    So that I can help them solve their problem

    Acceptance Criteria
    [ ] I must be on the question detail page
    [ ] I must provide a description that is at least 50 characters long
  ) #do
    # question = FactoryGirl.create(:question)
    # answer = FactoryGirl.build(:answer)
    # visit '/'
    # click_link question.title
    # click_link "Submit New Answer"
    # fill_in("Your Answer", with: answer.description)
    # click_button "Submit Answer"
    #
    # expect(page).to have_content(question.title)
    # expect(page).to have_content(question.description)
    # expect(page).to have_content(answer.description)
#  end


  pending "Incorrectly filling out answer form", %(
    [ ] I must be presented with errors if I fill out the form incorrectly
    )
    # add this when styling is working
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

  pending "not valid information", %(
    [ ] I must be presented with errors if I fill out the form incorrectly
  )

end

feature "Viewing a Question's Answers" do

  pending "look at a question", %(
    As a user
    I want to view the answers for a question
    So that I can learn from the answer

    Acceptance Criteria
    [ ] I must be on the question detail page
    [ ] I must only see answers to the question I'm viewing
    [ ] I must see all answers listed in order, most recent last
  )

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
    expect(page).not_to have_content(question.title)

  end

  scenario "delete from details page", %(
    [X] I must be able delete a question from the question details page
  ) do
    question = FactoryGirl.create(:question)
    visit question_path(question)
    click_link "Delete"

    expect(current_path).to eq(questions_path)
    expect(page).not_to have_content(question.title)
  end

  pending "check that answers are also deleted", %(
    [ ] All answers associated with the question must also be deleted
  )

end
