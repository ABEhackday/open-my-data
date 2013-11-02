module ApplicationHelper
  def body_helper_classes
    "#{ params[:controller].gsub('/','-') }-controller #{  params[:action] }-action"
  end
end
