class Issue < ActiveRecord::Base
  has_many :complaints

  def to_label
    if (I18n.locale == :zh) then 
      "#{chi_name}"
    else 
      "#{name}"
    end 
  end

   def display_name
    if (I18n.locale == :zh) then 
        "#{chi_name}"
    else 
        "#{name}"
    end 
  end

end
