class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, presence: true
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/bandmember.jpg"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  has_many :image, dependent: :destroy
  has_many :image_coment, dependent: :destroy
  has_many :like, dependent: :destroy

  def liking?(image)
    like.image.include?(image)
  end
end
