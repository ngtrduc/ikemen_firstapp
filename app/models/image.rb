class Image < ActiveRecord::Base
	mount_uploader :file
	validates :describle, length: {maximum: 100}
	belongs_to :user
	has_many :image_coment, -> { order "created_at DESC"}
end
