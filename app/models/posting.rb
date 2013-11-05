class Posting < ActiveRecord::Base
  belongs_to :category

  validates :title, :body, :location, presence: true

end
