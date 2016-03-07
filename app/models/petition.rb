class Petition < ActiveRecord::Base

  belongs_to :user

  validates :title, presence: true, uniqueness: true, length: { in: 5..30 }
  validates :text, presence: true
end
