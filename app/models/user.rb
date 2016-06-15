class User < ActiveRecord::Base

  has_many :petitions
  has_many :evaluations, class_name: "ReputationSystem::Evaluation", as: :source

  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }

  def voted_for?(petition)
    evaluations.where(target_type: petition.class, target_id: petition.id).present?
  end
end
