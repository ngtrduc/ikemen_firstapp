class Shared < ActiveRecord::Base
	  belongs_to :sharer, class_name: "User"
  belongs_to :shared, class_name: "Image"
  validates :sharer_id, presence: true
  validates :shared_id, presence: true
end
