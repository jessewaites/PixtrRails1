class LikeActivity < Activity

  def image
    actor.image
  end
  
  def image_name
    image.name 
  end
      
  def likable
    actor.likable
  end

  def likable_name
    likable.name
  end  

  def email
    actor.email
  end  

end  