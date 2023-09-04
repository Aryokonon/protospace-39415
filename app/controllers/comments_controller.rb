class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @prototype = Prototype.find(params[:prototype_id])
    @comment = @prototype.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @prototype, notice: 'コメントが投稿されました。'
    else
      redirect_to @prototype, alert: 'コメントを投稿できませんでした。'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end