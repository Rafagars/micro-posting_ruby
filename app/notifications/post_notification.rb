# To deliver this notification:
#
PostNotification.with(post: @post).deliver(User.all)

class PostNotification < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database
  deliver_by :action_cable
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  #
  param :post

  # Define helper methods to make rendering easier.
  #
  def message
    t("notification.post")
  end
  #
  def url
    post_path(params[:post])
  end
end
