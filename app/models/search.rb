class Search < ActiveRecord::Base
def listings
  find_listings
end

private

def find_listings
  p 'Hi'
  listings = Listing.order(:rent)
  listings = listings.where("cast(listings.#{self.category_id} as text) LIKE ?", "%#{keywords}%") if keywords.present?
  listings = listings.where("listings.rent >= ?", minimum_price ) if minimum_price.present?
  listings = listings.where("listings.rent <= ?", maximum_price ) if maximum_price.present?
  listings
end

end

