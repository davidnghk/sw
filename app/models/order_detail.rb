class OrderDetail < ActiveRecord::Base
	scope :daily, -> { where("repair_date >= ?", Time.zone.now.beginning_of_day) } ; 
	scope :last_3_months, -> { where( 'created_at >= ? ', Date.today.last_quarter.beginning_of_month) };
end
