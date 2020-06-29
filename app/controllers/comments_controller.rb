class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = Comment.new(comment_params)
    @post = @comment.post
    if @comment.save
      respond_to :js
    else
      flsh[:alert] = "コメントに失敗しました"
    end
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    @post = @comment.post
    if @comment.destroy
      respond_to :js
    else
      flsh[:alert] = "コメント削除に失敗しました"
  end
end

  private
   def comment_params
     params.require(:comment).permit(:user_id, :post_id,
     :comment)
end
