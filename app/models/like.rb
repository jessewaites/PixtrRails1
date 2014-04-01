class Like < ActiveRecord::Base
  belongs_to :user

  belongs_to :likable, polymorphic: true

  has_many :activities, as: :subject, dependent: :destroy

  validates :likable, presence: true

end