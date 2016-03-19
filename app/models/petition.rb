class Petition < ActiveRecord::Base

  belongs_to :user
  has_reputation :votes, source: :user, aggregated_by: :sum

  validates :title, presence: true, uniqueness: true, length: { in: 5..30 }
  validates :text, presence: true

  def published?
    created_at < 30.day.ago
  end
end
