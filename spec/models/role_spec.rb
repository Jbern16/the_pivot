require 'rails_helper'

RSpec.describe Role, type: :model do
  context "validations" do
    it {is_expected.to validate_presence_of(:name)}
    it {should have_many(:users)}
  end 
end
