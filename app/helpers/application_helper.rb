module ApplicationHelper
  def publisher(offer)
    ret = "#{link_to offer.user.name, "#"}"+
    if signed_in? && offer.user == current_user
      "<span class='info-success'>(you)</span>"
    end
    ret.html_safe
  end
end
