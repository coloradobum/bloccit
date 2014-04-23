class CommentsController < ApplicationController

  def create
    # @topic = Topic.find( params[:topic_id] )
    # @post = @topic.posts.find( params[:post_id] )
    # @comments @post.comments
    #
    # @comment = current_user.commments.build( comment_params )
    # @comment.post = @post
    # @new_comment = Comment.new
    #
    # authorize @comment
  end

  def new

  end

  private

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end

end
