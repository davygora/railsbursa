class Vote < ActiveRecord::Base

  belongs_to :petition

  validates_uniqueness_of :petition_id, scope: :user_id
  validates_presence_of :petition_id, :user_id

end
