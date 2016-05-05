class Relationship < ActiveRecord::Base
	belongs_to :liker, class_name: "User"
	belongs_to :liked_image, class_name: "Image"
	validates :liker_id, presence: true
    validates :liked_image_id, presence: true
end
