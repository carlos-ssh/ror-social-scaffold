require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the UserHelper. For example:
#
# describe UserHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe UserHelper, type: :helper do
  let(:create_user) do
    User.create(name: 'carlos', email: 'carlos@helloworld.com', password: 'carlos123')
  end

  describe '#same_user?' do
    it 'returns true when users are equal' do
      create_user
      test = same_user?(User.first, User.first)
      expect(test).to be(true)
    end
    it 'returns false when users are not equal' do
      create_user
      user2 = User.create(name: 'james', email: 'james@james.com', password: 'james123')
      test = same_user?(User.first, user2)
      expect(test).to be(false)
    end
  end
end