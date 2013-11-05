require 'friendly_id'

class Posting < ActiveRecord::Base
  extend FriendlyId
  belongs_to :category
  friendly_id :hashed_urls, use: :slugged

  validates :title, :body, :location, :slug, presence: true

  def hashed_urls
    Digest::SHA1.hexdigest self.title
  end
end
