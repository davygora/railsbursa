class Petition < ActiveRecord::Base

  belongs_to :user
  has_many :votes

  validates :title, presence: true, uniqueness: true, length: { in: 5..30 }
  validates :text, presence: true
end
