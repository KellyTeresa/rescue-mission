require 'rails_helper'

feature "Interaction with Questions" do

  pending "View All Questions", %(
  As a user
  I want to view recently posted questions
  So that I can help others

  Acceptance Criteria
  [ ] I must see the title of each question
  [ ] I must see questions listed in order, most recently posted first
  )

  pending "View a Question's Details", %(
  As a user
  I want to view a question's details
  So that I can effectively understand the question

  Acceptance Criteria

  [ ] I must be able to get to this page from the questions index
  [ ] I must see the question's title
  [ ] I must see the question's description
  )


pending "Post a Question", %(
  As a user
  I want to post a question
  So that I can receive help from others

  Acceptance Criteria

  [ ] I must provide a title that is at least 40 characters long
  [ ] I must provide a description that is at least 150 characters long
  [ ] I must be presented with errors if I fill out the form incorrectly
  )

pending "Answering a Question", %(
  As a user
  I want to answer another user's question
  So that I can help them solve their problem

  Acceptance Criteria

  - I must be on the question detail page
  - I must provide a description that is at least 50 characters long
  - I must be presented with errors if I fill out the form incorrectly
  )

pending "Viewing a Question's Answers", %(
  As a user
  I want to view the answers for a question
  So that I can learn from the answer

  Acceptance Criteria

  - I must be on the question detail page
  - I must only see answers to the question I'm viewing
  - I must see all answers listed in order, most recent last
  )

pending "Editing a Question", %(
  As a user
  I want to edit a question
  So that I can correct any mistakes or add updates

  Acceptance Criteria

  - I must provide valid information
  - I must be presented with errors if I fill out the form incorrectly
  - I must be able to get to the edit page from the question details page
  )
  
Deleting a Question

As a user
I want to delete a question
So that I can delete duplicate questions

Acceptance Criteria

- I must be able delete a question from the question edit page
- I must be able delete a question from the question details page
- All answers associated with the question must also be deleted

end
