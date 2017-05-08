class StepElements::CommentsController < CommentsController
    before_action :set_commentable
    
    private
    
    def set_commentable
        @commentable = StepElement.find(params[:step_element_id])
    end
end