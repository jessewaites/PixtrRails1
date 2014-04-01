class User < ActiveRecord::Base
  include Clearance::User

  validates :name, presence: true
  validates :description, presence: true

  has_many :activities
  has_many :galleries, dependent: :destroy

  has_many :likes, dependent: :destroy, inverse_of: :user
  has_many :liked_images,
  through: :likes,
  source: :likable,
  source_type: 'Image'

  has_many :images, through: :galleries

  has_many :group_memberships, 
  foreign_key: :member_id

  has_many :groups, through: :group_memberships

  has_many :followed_user_relationships, 
  foreign_key: :follower_id, 
  class_name: "FollowingRelationship", dependent: :destroy

  has_many :followed_users, 
  through: :followed_user_relationships

  has_many :follower_relationships, 
  foreign_key: :followed_user_id, 
  class_name: "FollowingRelationship"

  has_many :followers, through: :follower_relationships

  def follow(other_user)
    following_relationship = followed_user_relationships.create(followed_user: other_user)
    notify_followers(following_relationship, other_user, "FollowingRelationshipActivity")
  end

  def unfollow(user)
    followed_users.destroy(user)
  end  

  def following?(user)
    followed_user_ids.include? user.id
  end

  def join group
    group_membership = group_memberships.create(group: group)
    notify_followers(group_membership, group, "GroupMembershipActivity")
  end

  def leave group
    groups.destroy(group)
  end

  def joined?(group)
    group_ids.include? group.id
  end


  def like target
    like = likes.create(likable: target) 
    notify_followers(like, target, "LikeActivity")
  end 

  def unlike target
    like = likes.find_by(likable: target)
    like.destroy
  end

  def likes? target
    likes.exists?(likable: target)
  end

  # without delayed_job
  #@user.activate!(@device)

  # with delayed_job
  #@user.delay.activate!(@device)

  def notify_followers subject, target, type
    if subject.persisted?
      followers.each do |follower|
        follower.delay.activities.create(
        subject: subject,
        type: type,
        target: target,
        target_type: "User", 
        actor: self        
        )
      end
      NotificationMailer.notification_email(self).deliver 
    end 
  end

  handle_asynchronously :notify_followers

end