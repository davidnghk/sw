class Item < ActiveRecord::Base
  belongs_to :order
  belongs_to :defect
  has_many :photos, as: :photoable, dependent: :destroy


  default_scope { order('due_date') }

end 
 