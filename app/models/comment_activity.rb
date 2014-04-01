class CommentActivity < Activity

  def email
    actor.user.email
  end

  def commented_image
    actor.image.name
  end

  def image
    actor.image
  end  

  def commenter_email
    actor.user.email
  end
  
  def commenter_name
    actor.image.name
  end  

    
end

