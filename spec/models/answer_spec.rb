require 'rails_helper'

RSpec.describe Question, type: :model do
  answer = FactoryGirl.build(:answer)
  it "is valid" do
    expect(answer.valid?).to eq true
  end
  it "is attached to a question" do
    expect(answer.question_id).not_to be_empty
    expect(answer.question_id).to be_a Fixnum
  end
  it "has a description" do
    expect(answer.description).not_to be_empty
    expect(answer.description).to be_a String
  end
end
