class CommentsController < ApplicationController

  before_action :set_post, only: [:create]

  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @post, notice: 'Comentário criado com sucesso.'
    else
      redirect_to @post, alert: 'Não foi possível criar o comentário.'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = @comment.post
    @comment.destroy
    redirect_to @post, notice: 'Comentário excluído com sucesso.'
  end

  def get_csrf_token
    render json: { csrf_token: form_authenticity_token }
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
