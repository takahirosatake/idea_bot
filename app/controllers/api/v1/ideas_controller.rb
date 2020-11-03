class Api::V1::IdeasController < Api::V1::BaseController
  protect_from_forgery 
  # GET /ideas
  def index
    if params[:category_name]
      category = Category.find_by(name: params[:category_name])
      return render json: { status:404 } if category.nil?
      ideas = category.ideas
    else 
      ideas = Idea.all
    end
    serializable_resource = ActiveModelSerializers::SerializableResource.new(
          ideas,
          each_serializer: IdeaSerializer
        )
        ideas = { data: serializable_resource.as_json }
        render json: ideas
  end
  
  def create
    idea = Idea.new(idea_params)
    if idea.save
      render json: { status: 201 }
    else
      render json: { status: 422 }
    end
  end
  
  private
    def idea_params
      params.require(:idea).permit(:category_id, :body)
    end
end
  





