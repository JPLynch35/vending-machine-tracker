require 'rails_helper'

describe Machine, type: :model do
  describe 'instance methods' do
    it 'can calculate average snack price' do
      owner = Owner.create(name: "Sam's Snacks")
      dons1  = owner.machines.create(location: "Don's Mixed Drinks")
      snack1 = dons1.snacks.create(name: 'Doritos', price: 150)
      snack2 = dons1.snacks.create(name: 'Cookies', price: 250)
      snack3 = dons1.snacks.create(name: 'Peanuts', price: 100)
      
      expect(dons1.average_price).to eq(1.67)
    end
  end
end
