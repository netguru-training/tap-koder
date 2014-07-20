module ApplicationHelper
  def publisher(offer)
    ret = "#{link_to offer.user.name, "#"}"+
    if signed_in? && offer.user == current_user
      "<span class='info-success'>(you)</span>"
    end
    ret.html_safe
  end
  
  def codes_used offer    
    html_class = 
      if offer.codes_used <= offer.code_limit/2
        'info-success'
      elsif offer.codes_used < offer.code_limit
        'info-warning'
      else
        'info-danger'
      end
    ret = 
      content_tag :div, :class => html_class do
        concat(content_tag :span, offer.codes_used, :id=>'js_offer_used')
        concat ' / '
        concat(content_tag :spam, offer.code_limit)
      end
          
      ret
  end
    
  
  
  
end
