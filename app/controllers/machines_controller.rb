class MachinesController < ApplicationController
  def index
    @owner = Owner.find(params[:owner_id])
  end

  def show
    @machine = Machine.includes(:snacks).find(params[:id])
    @average_price = (@machine.snacks.average(:price)/100).round(2)
  end
end
