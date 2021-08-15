require 'rails_helper'

describe Question, type: :model do
  it { should validate_presence_of :title}
  it { should validate_presence_of :body}
end
