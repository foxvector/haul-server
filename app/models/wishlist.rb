class Wishlist < ApplicationRecord
  belongs_to :shop

  def self.find_or_create(wishlist_params)
    model = find_by(wishlist_params[:token])
    model.create(wishlist_params) if model.blank?
    model
  end
end
