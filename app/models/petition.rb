class Petition < ActiveRecord::Base

  VALIDITY = 30

  belongs_to :user
  has_reputation :votes, source: :user, aggregated_by: :sum

  validates :title, presence: true, uniqueness: true, length: { in: 5..30 }
  validates :text, presence: true

  def published?
    created_at < VALIDITY.day.ago
  end
end
