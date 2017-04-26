class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  #Once thing to remember here: You have to list rescue_from in ascending order of specificity.
  #You need to do it this way because Rails returns the last matching rescue_from value, and if you had the basic
  #Exception listed last like so… then you would only ever render a 500 template, because the rescue_from Exception,
  #:with => :render_500 would clobber any previous matching rescue_from options.

end
