class Order < ActiveRecord::Base  
  include AASM
  #before_action :is_authorised, only: [:photo_upload]

  belongs_to :user
#  belongs_to :district
  belongs_to :issue      
  has_many :items
  has_many :photos, as: :photoable, dependent: :destroy
  has_many :order_parties, inverse_of: :order, dependent: :destroy
  # after_save :create_notification
  before_create :set_orderno 
  # before_save :set_dates 

  default_scope { order('booking_datetime DESC') }

  scope :Due, -> { where(is_due: true)}
  scope :history, -> { where(role: :manager)}
  scope :history, lambda{ where("repair_datetime < ?", Date.today) }

  validates_presence_of :booking_datetime,  :status, :issue_id, :user_ref

  enum status: {Open: 0, Cancelled: 2, Filed: 13}

  aasm(:status) do
    state :Open, :initial => true

    state :Cancelled, :Filed

    event :cancel do
      transitions :from => :Open, :to => :Cancelled
    end

    event :file do
      transitions :from => :Open, :to => :Filed
    end

  end

  def self.i18n_statuses(hash = {})
    statuses.keys.each { |key| hash[I18n.t("statuses.#{key}")] = key }
    hash
  end

  def self.details(job_id)
    statuses.keys.each { |key| hash[I18n.t("statuses.#{key}")] = key }
    hash
  end

  def is_due
    self.deadline >= Date.today
  end

  def report_deadline
    #if self.completion_datetime?
    self.report_deadline_datetime
    #  self.completion_datetime.days_ago(self.report_duration * -1 ) 
    #end
  end

  private  
  def set_orderno
    max_code = Order.maximum(:order_no)
    cur_year = Date.current.year - 2000 
    if max_code.to_i > cur_year * 100000
      self.order_no = max_code.to_i + 1
    else 
      self.order_no = cur_year * 100000 + 1
    end
    max_ref_no = Order.where(" user_ref = ? ", self.user_ref).count + 1
    #max_ref_no = Order..where('user_id = ?', current_user.id).count + 1
    self.user_ref_no = max_ref_no
  end
      
  def is_authoorised
    redirect_to root_path, alert: "You don't have the permission"
      unless current_user.Manager? or current_user.Operator? or
        current_user.id == @order.technician_id
    end
  end

  def set_dates
    if self.status_changed?
      if self.Completed? 
        self.completion_datetime = Time.now 
      end 
      if self.InProgress?
        self.acknowledge_datetime = Time.now 
      end
    end 

    if self.completion_datetime_changed? and self.InProgress?
      # self.report_deadline_datetime = self.completion_datetime.days_ago(self.report_duration * -1 )
      self.complete!
    end 
    if self.completion_report_datetime_changed? and self.Completed?
        self.report!
    end 
    if self.appraisal_datetime_changed? and self.Reported?
        self.appraise!
    end 
  end

  def create_notification
    if self.worker_id_changed? and self.worker_id?
      #Notification.create(content: "請注意，一個新工作已分配給您.", user_id: self.worker_id)
      #OrderMailer.order_to_worker(self.id).deliver_now
    end
    if self.contractor_id_changed? and self.contractor_id?
      #Notification.create(content: "請注意，一個新工作已分配給您.", user_id: self.contractor_id)
      #OrderMailer.order_to_contractor(self.id).deliver_now
    end
  end

end
