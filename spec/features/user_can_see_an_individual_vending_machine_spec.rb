require 'rails_helper'

feature 'When a user visits a vending machine show page' do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack1 = dons.snacks.create(name: 'Doritos', price: 150)
    snack2 = dons.snacks.create(name: 'Cookies', price: 250)
    snack3 = dons.snacks.create(name: 'Peanuts', price: 100)

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end
  scenario 'they see a list of all the snacks in the machine with their price' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack1 = dons.snacks.create(name: 'Doritos', price: 150)
    snack2 = dons.snacks.create(name: 'Cookies', price: 250)
    snack3 = dons.snacks.create(name: 'Peanuts', price: 100)
    visit machine_path(dons)

    expect(page).to have_content("Snack: #{snack1.name} for $#{snack1.price/100.0}")
    expect(page).to have_content("Snack: #{snack2.name} for $#{snack2.price/100.0}")
    expect(page).to have_content("Snack: #{snack3.name} for $#{snack3.price/100.0}")
  end
  scenario 'they see the average snack price' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack1 = dons.snacks.create(name: 'Doritos', price: 150)
    snack2 = dons.snacks.create(name: 'Cookies', price: 250)
    snack3 = dons.snacks.create(name: 'Peanuts', price: 100)
    visit machine_path(dons)

    expect(page).to have_content("Average Snack Price: $1.67")
  end
end
