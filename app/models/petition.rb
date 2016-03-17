class Petition < ActiveRecord::Base

  belongs_to :user
  has_reputation :votes, source: :user, aggregated_by: :sum
  validates :title, presence: true, uniqueness: true, length: { in: 10..200 }
  validates :text, presence: true

end
