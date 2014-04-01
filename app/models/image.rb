class Image < ActiveRecord::Base
  belongs_to :gallery
  has_many :comments
  has_many :likes, as: :likable, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user

  has_many :group_images, dependent: :destroy
  has_many(:groups, { through: :group_images })

  validates :name, presence: true
  validates :description, presence: true
  validates :url, presence: true

  def user
    gallery.user
  end

  def email
    actor.email
  end

end