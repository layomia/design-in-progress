class StepsController < ApplicationController
    before_action :set_step, only: [:show, :edit, :update, :destroy]
    
    @@dipInfo = nil
    
    def index
        @steps = Step.all
    end
    
    def new
        @step = Step.new
        @dip = Dip.find(params[:dip])
        @@dipInfo = @dip
    end
    
    def create
        if (@@dipInfo.user != current_user)
            flash[:danger] = "You are not authorized to do that"
            redirect_to feed_path
        end
        
        # image validation
        if params[:images] == nil
          flash[:danger] = "You must upload at least one image."
          render 'new'
          return
        end
        
        @step = Step.new(step_params)
        @step.dip = @@dipInfo

        if @step.save
            params[:images].each do |image|
              @step_element = StepElement.create(image: image)
              @step_element.step = @step
              
              if not @step_element.save
                flash[:danger] = "'image.original_filename' — #{@step_element.errors.full_messages.join(', ')}"
                @step.destroy
                render 'new'
                return
              end
            end
            
            # Success
            flash[:success] = "Step was successfully added!"
            redirect_to @step.dip
            
        else
            render 'new'
        end
    end
    
    # DELETE /steps/1
    def destroy
        if @step.dip.steps.length == 1
            @step.dip.destroy
            flash[:success] = "Step and Dip successfully destroyed."
        else
            @step.destroy
            flash[:success] = "Step was successfully destroyed."
        end
        redirect_to feed_path
    end
    
    private
    def set_step
      @step = Step.find(params[:id])
    end
    
    def step_params
        params.require(:step).permit(:description, :step_elements)
    end
end