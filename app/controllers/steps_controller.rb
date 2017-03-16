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
        
        @step = Step.new(step_params)
        @step.dip = @@dipInfo

        if @step.save
            if params[:images].each { |image|
                @step.step_elements.create(image: image)
            }
            end
            flash[:success] = "Step was successfully created!"
            @step.dip.touch
            redirect_to @@dipInfo
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