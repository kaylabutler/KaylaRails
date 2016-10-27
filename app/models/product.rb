class Product < ActiveRecord::Base
	has_many :comments
	validates :name, presence: true
	validates :description, presence: true
	validates :image_url, presence: true
	validates :color, presence: true
	validates :price, presence: true

	def highest_rating_comment
		comments.rating_desc.first
	end

	def average_rating
		comments.average(:rating).to_f
	end

	  after_save :invalidate_cache

  private
  def invalidate_cache
     Rails.cache.delete("/users/#{self.id}")
  end
end