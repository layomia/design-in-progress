class DipsController < ApplicationController
  before_action :set_dip, only: [:show, :edit, :update, :destroy]
  helper_method :image_url, :step_images

  # GET /dips
  # GET /dips.json
  def index
    @dips = Dip.all.order("updated_at DESC")
  end

  # GET /dips/1
  # GET /dips/1.json
  def show
  end

  # GET /dips/new
  def new
    @dip = Dip.new
    @step = Step.new
  end

  # GET /dips/1/edit
  def edit
  end

  # POST /dips
  # POST /dips.json
  def create
    @dip = Dip.new(dip_params)
    @dip.user = current_user
    
    # image validation
    if params[:images] == nil
      flash[:danger] = "You must upload at least one image."
      render 'new'
      return
    end
    
    if @dip.save
      @step = Step.new(dip_params)
      @step.dip = @dip

      if @step.save
        params[:images].each do |image|
          @step_element = StepElement.create(image: image)
          @step_element.step = @step
          
          if not @step_element.save
            flash[:danger] = "'image.original_filename' — #{@step_element.errors.full_messages.join(', ')}"
            @dip.destroy
            render 'new'
            return
          end
        end
        
        # Success
        flash[:success] = "Dip was successfully created!"
        redirect_to @dip
      else
        @dip.destroy
        render 'new'
      end
    else
      render 'new'
    end
  end
  
  # PATCH/PUT /dips/1
  # PATCH/PUT /dips/1.json
  def update
    respond_to do |format|
      if @dip.update(dip_params)
        format.html { redirect_to @dip, notice: 'Dip was successfully updated.' }
        format.json { render :show, status: :ok, location: @dip }
      else
        format.html { render :edit }
        format.json { render json: @dip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dips/1
  # DELETE /dips/1.json
  def destroy
    @dip.destroy
    flash[:success] = "Dip was successfully destroyed."
    redirect_to feed_path
  end
  
  #helpers
  
  def image_url(img)
    temp = img.slice(2,img.length - 2).split('/')
    temp[1] = "#{temp[1]}.#{temp[0]}"
    temp.shift
    "http://#{temp.join("/")}"
  end
  
  def step_images(step)
    attachments = step.step_elements.map(&:image)
    attachments.map(&:url).map{|x| image_url(x)}
  end
  
  #helpers
  
  def image_url(img)
    temp = img.slice(2,img.length - 2).split('/')
    temp[1] = "#{temp[1]}.#{temp[0]}"
    temp.shift
    "http://#{temp.join("/")}"
  end
  
  def step_images(step)
    attachments = step.step_elements.map(&:image)
    a = attachments.map(&:url).map{|x| image_url(x)}
    puts 'looking at'
    puts a
    puts 'this shit'
    return a
  end
    

  private
    def set_dip
      @dip = Dip.find(params[:id])
    end

    def dip_params
      params.require(:dip).permit(:name, :description, :step_elements)
    end
  
end
