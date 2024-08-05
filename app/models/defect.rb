class Defect < ActiveRecord::Base

  def to_label
    "#{code} #{name} #{chi_name}"
  end
  
  def short_name
    if (I18n.locale == :zh) then 
	    "#{code} #{chi_name}"
    else 
    	"#{code} #{name} "
    end 
  end

  def display_name
    "#{code} #{name} #{chi_name}"
  end
end
