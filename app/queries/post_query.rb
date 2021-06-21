class PostQuery
  attr_reader :params

  def initialize(params)
    @params = params || {}
  end

  def index
    posts = Post.all
    posts = Post.where(published: params[:published]) if params[:published].present?
    respond_with posts
  end

  def create
    post = Post.create(params)
    respond_with post
  end

  def update
    post = Post.find(params[:id])
    post.update(params.except(:id))
    respond_with post
  end

  def destroy
    post = Post.find(params[:id])
    p params[:id]
    post.destroy
    respond_with post
  end

  private
  
  def respond_with(response)
    # TODO: handle serialization, validation errors, etc...
    if response.is_a?(Post)
      p response.errors.full_messages.to_sentence unless response&.valid?
      return response.errors unless response&.valid?
    end

    json = response.to_json
    p json
    JSON.generate json
  end
end