class Job < ActiveRecord::Base
  validates :title, :description, :company, presence: true

end
