require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user can have many houses" do
    user = User.create!(email: 'clia88@gmail.com', password: 'password')
    house = House.create
    user.user_houses.build(house: house, starred: true, description: 'party house must buy.')

    assert_equal [house], user.houses
  end
end
