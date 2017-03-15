class StepsController < ApplicationController
    def index
        redirect_to root_path
        #redirect_to feed
    end
    
    def new
        @step = Step.new
    end
    
    def create
        @step = Step.new(step_params)

        if @step.save
            if params[:images].each { |image|
                @step.step_elements.create(image: image)
            }
            end
            flash[:success] = "Step was successfully created!"
            redirect_to step_path(@step)
        else
            render 'new'
        end
    end
    
    private
    def step_params
        params.require(:step).permit(:name, :description, :step_elements)
    end
end