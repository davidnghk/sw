class OrderMailer < ApplicationMailer
  
  def new_order_to_authority(order)
    @order = order
    mail(to: 'complaint@hyd.gov.hk', cc: @order.user.email, subject: '新道路報告: ' + @order.issue.display_name + 
           ' (' + ' ' + @order.location + ') ' )
  end

  def escalate_order_to_manager(order)
    @order = order
    @user = User.manager
    @user.each do |u| 
        mail(to: u.email, subject: '上報柯打: ' + @order.store.client.chi_name + ' (' + @order.store.code + ' ' + @order.store.chi_name + ') ')
    end 
  end
    
end