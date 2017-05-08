class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :current_user, :logged_in?, :image_url, :step_images, :dip_latest_step, :step_primary_image
  
  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end
  
  def logged_in?
    !!current_user
  end
  
  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to root_path
    end
  end

  def image_url(img)
    temp = img.slice(2,img.length - 2).split('/')
    temp[1] = "#{temp[1]}.#{temp[0]}"
    temp.shift
    "https://#{temp.join("/")}"
  end
  
  def step_images(step)
    attachments = step.step_elements.map(&:image)
    puts attachments.map(&:url).map{|x| image_url(x)}
    attachments.map(&:url).map{|x| image_url(x)}
  end
  
  def dip_latest_step(dip)
    dip.steps.order('created_at DESC').first
  end
  
  def step_primary_image(step)
    step.step_elements.first.image.url(:small_display)
  end
  
  def step_element_comment_prompt
    @step_element = StepElement.find(params[:id])
    @relX = params[:relX]
    @relY = params[:relY]
    
    respond_to do |format|
      format.html do
          flash[:danger] = 'You need JavaScript enabled to add a comment'
          redirect_to root_path
      end
      format.js
  end
    
  end
end
