class Gallery < ActiveRecord::Base
  has_many :images, dependent: :destroy
  belongs_to :user, dependent: :destroy

  validates :name, presence: true
  validates :user, presence: true

  has_many :likes, as: :likable

end