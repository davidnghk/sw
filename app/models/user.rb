class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, 
         :confirmable, :recoverable, :rememberable, :trackable, 
         :validatable, :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :orders

  has_many :contractor_orders, :class_name => 'Order', :foreign_key => 'contractor_id'
  has_many :worker_orders, :class_name => 'Order', :foreign_key => 'worker_id'

  scope :Contractor, -> { where(role: :Contractor)}
  scope :Worker, -> { where(role: :Worker)}
  scope :Manager, -> { where(role: :Manager)}
  scope :Officer, -> { where(role: :Officer)}
  scope :Admin, -> { where(role: :Admin)}

  enum role: [:Admin, :Manager, :Officer, :Contractor, :Worker, :New, :Reporter]
  enum status: [:Pending, :Approved, :Disapproved]

  validates_presence_of :name, :email
  validates_uniqueness_of :email 
  
  # has_attached_file :image, styles: { medium: "300x300>", thumb: "200x200>" }
  # validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png', 'image/pdf']  
  

  def to_label
    "#{name}"
  end 

  def self.user_name(user_id) 
    User.find(user_id).name
  end

  def self.from_omniauth(access_token)
      data = access_token.info
      user = User.where(email: data['email']).first

      # Uncomment the section below if you want users to be created if they don't exist
      unless user
          user = User.create(
             name: data['name'],
             email: data['email'],
             password: Devise.friendly_token[0,20]
          )
      end
      user
  end

end
