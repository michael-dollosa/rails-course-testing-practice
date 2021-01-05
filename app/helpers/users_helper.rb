module UsersHelper
  def gravatar_img(user)
    # get the email from URL-parameters or what have you and make lowercase
    email_address = user.email.downcase
      
    # create the md5 hash
    hash = Digest::MD5.hexdigest(email_address)
    
    # compile URL which can be used in <img src="RIGHT_HERE"...
    user_image = "https://www.gravatar.com/avatar/#{hash}?s=200"

    #return in an image tag
    image_tag(user_image, alt: user.username, class: "rounded mx-auto d-block")
    
  end
end
