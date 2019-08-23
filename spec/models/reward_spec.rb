require 'rails_helper'

RSpec.describe Reward, type: :model do
  describe "validations" do
    it "is valid" do
      reward = Reward.new(cost: 50, name:"name")
      errors = reward.errors.full_messages

      expect(reward.valid?).to be true
      expect(errors).to be_empty
    end
    # it "is invalid without a name" do
    #   reward = Reward.new(cost: 50, name: nil)
    #   errors = reward.errors.full_messages

    #   expect(reward.valid?).to be false
    #   expect(errors).to include("Name can't be blank")
    # end
  end
  describe "attributes" do
    
  end
  describe "scopes" do
    
  end
  describe "instance methods" do
    
  end
end
