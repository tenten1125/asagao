class Member < ApplicationRecord
  def self.search(query)
    rel = order('number')
    rel = rel.where('name LIKE ? OR full_name LIKE ?', "%#{query}%", "%#{query}%") if query.present?
    rel
  end
end
