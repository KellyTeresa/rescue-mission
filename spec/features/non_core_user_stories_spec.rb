require 'rails_helper'

feature "Markdown Support", %(
  As a user
  I want to write my questions and answers with markdown
  So I can easily format my questions and answers
) do

  pending "user adds markdown to question", %(
    [ ] I can write my questions using markdown syntax
    [ ] Questions, when shown, should be the HTML rendered from the
    markdown
  )

  pending "user adds markdown to answer", %(
    [ ] I can write my answers using markdown syntax
    [ ] Answers, when shown, should be the HTML rendered from the
    markdown
  )

end

feature "Choosing an Answer", %(
  As a user
  I want to mark an answer as the best answer
  So that others can quickly find the answer
) do
  scenario "look at available answers" do
    @question = FactoryGirl.create(:question)
    @one_answer = FactoryGirl.create(:answer, question: @question)
    @other_answer = FactoryGirl.create(:answer, question: @question)

    visit '/'
    click_link @question.title

    expect(page).to have_content "No Chosen Answer"
    expect(page).to have_content @one_answer.description
    expect(page).to have_content @other_answer.description
  end

  scenario "mark an answer as best", %(
    [ ] I must be on the question detail page
    [ ] I must be able mark an answer as the best
    [ ] I must see the "best" answer above all other answers in the answer list
  ) do
    @asker = FactoryGirl.create(:user)
    @helpful = FactoryGirl.create(:user)
    @question = FactoryGirl.create(:question, user: @asker)
    @answer_to_choose = FactoryGirl.create(:answer, question: @question, user: @helpful)

    visit '/'
    click_link @question.title
    within("#answer_id_#{@answer_to_choose.id}") do
      click_link "Accept Answer"
    end

    expect(page).to have_content "Chosen Answer! #{@answer_to_choose.description}"
  end
end

feature "User Authentication", %(
  As a user
  I want to sign in
  So that my questions and answers can be associated to me
) do

  pending "user signs in", %(
    [ ] I must be able to sign in using GitHub
  )

  pending "user signs out", %(
    [ ] I must be able to sign out from any page
  )

  pending "user edits own question", %(
    [ ] I must be signed in
    [ ] I must be able to edit a question that I posted
  )

  pending "user attempts to edit someone else's question", %(
    [ ] I can't edit a question that was posted by another user
  )

  pending "user selects best answer for own question", %(
    [ ] I must be signed in
    [ ] I must be able to choose the "best" answer for a question that I posted
  )

  pending "user attempts to choose best answer for someone else's question", %(
    [ ] I can't choose the best answer for a question that was posted by another user
  )

  pending "user deletes own question", %(
    [ ] I must be signed in
    [ ] I must be able to delete a question that I posted
  )

  pending "user attempts to delete someone else's question", %(
    [ ] I can't delete a question that was posted by another user
  )
end
