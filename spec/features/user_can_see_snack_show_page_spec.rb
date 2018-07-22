require 'rails_helper'

feature 'When a user visits a snack show page' do
  scenario 'they see all information for that snack' do
    owner = Owner.create(name: "Sam's Snacks")
    dons1  = owner.machines.create(location: "Don's Mixed Drinks")
    dons2  = owner.machines.create(location: "Don's Non-Mixed Drinks")
    snack1 = dons1.snacks.create(name: 'Doritos', price: 150)
    snack2 = dons1.snacks.create(name: 'Cookies', price: 250)
    snack3 = dons1.snacks.create(name: 'Peanuts', price: 100)
    MachineSnack.create(snack_id: snack1.id, machine_id: dons2.id)

    visit snack_path(snack1)
    
    expect(page).to have_content(snack1.name)
    expect(page).to have_content("Price: $1.5")
    expect(page).to have_content("#{dons1.location}")
    expect(page).to have_content("Average Snack Price: $1.67")
    expect(page).to have_content("Number of Snacks: #{dons1.snacks.count}")
    expect(page).to have_content("#{dons2.location}")
    expect(page).to have_content("Average Snack Price: $1.67")
    expect(page).to have_content("Number of Snacks: #{dons2.snacks.count}")
  end
end
