class Petition < ActiveRecord::Base

  VALIDITY = 30

  belongs_to :user
  has_reputation :votes, source: :user, aggregated_by: :sum

  validates :title, presence: true, uniqueness: true, length: { in: 5..30 }
  validates :text, presence: true

  scope :published, -> { where("created_at <= ?", VALIDITY.days.ago.beginning_of_day) }

  def published?
    created_at < VALIDITY.days.ago
  end

  def owner?(other_user)
    user == other_user
  end
end
