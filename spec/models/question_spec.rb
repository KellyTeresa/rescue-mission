require 'rails_helper'

RSpec.describe Question, type: :model do
  question = FactoryGirl.build(:question)
  it "is valid" do
    expect(question.valid?).to eq true
  end
  it "has a title" do
    expect(question.title).not_to be_empty
    expect(question.title).to be_a String
  end
  it "has a description" do
    expect(question.description).not_to be_empty
    expect(question.description).to be_a String
  end
end
