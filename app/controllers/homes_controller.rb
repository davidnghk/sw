class HomesController < ApplicationController
  def show
    @orders = OrderDetail.all
  end

  def chart1day
    @orders = OrderDetail.daily
  end

  def chart3months
    @orders = OrderDetail.last_3_months
  end

end
