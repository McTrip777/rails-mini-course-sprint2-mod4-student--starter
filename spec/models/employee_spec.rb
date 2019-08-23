require 'rails_helper'

RSpec.describe Employee, type: :model do

  describe "validations" do
    it "is valid" do
      employee = Employee.new(first_name: "first", last_name:"last", rewards_balance: 5)
      errors = employee.errors.full_messages

      expect(employee.valid?).to be true
      expect(errors).to be_empty
    end
    it "is invalid without a first_name" do
      employee = Employee.new(first_name: nil, last_name:"last", rewards_balance: 5)
      result = employee.valid?
      errors = employee.errors.full_messages

      expect(result).to be false
      expect(errors).to include("First name can't be blank")
    end
    it "is invalid without a last_name" do
      employee = Employee.new(first_name: "first", last_name: nil, rewards_balance: 5)
      result = employee.valid?
      errors = employee.errors.full_messages

      expect(result).to be false
      expect(errors).to include("Last name can't be blank")
    end
  end

  describe "attributes" do
    it "has expected attributes" do
      employee = Employee.new(first_name: "first", last_name: nil, rewards_balance: 5)

      result = employee.attribute_names.map {|name| name.to_sym}
      expect(result).to contain_exactly(
        :first_name,
        :last_name,
        :updated_at,
        :created_at,
        :rewards_balance,
        :id
      )
    end
  end

  describe "scopes" do
    describe ".zero_balance" do
      before do
        employee = Employee.create!([
          {first_name: "first", last_name: "last", rewards_balance: 0},
          {first_name: "second", last_name: "last", rewards_balance: 0},
          {first_name: "third", last_name: "last", rewards_balance: 5},
        ])
      end
      it "returns only the Emplyees with a zero_balance" do
        result = Employee.zero_balance

        expect(result.count).to eq 2
        expect(result.first.first_name).to eq "first"
        expect(result.last.first_name).to eq "second"
      end
    end
  end

  describe "instance methods" do
    describe "#full_name" do
      let (:employee) {Employee.create!(first_name: "first", last_name: "last", rewards_balance: 0)}
      it "returns both first_name and last_name" do
        result = employee.full_name

        expect(result).to eq "first last"
        # expect(result.last.first_name).to eq "second"
      end
    end
  end

# ### Instance Methods

# 1. Test that the `full_name` method returns expected results
#    - Test that the `can_afford?` method returns expected results
#      - Cover the affordable context and the unaffordable context
end
