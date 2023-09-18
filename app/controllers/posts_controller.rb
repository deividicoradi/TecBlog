class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  skip_before_action :verify_authenticity_token, only: [:create]

  def index
    @posts = Post.all
    render json: @posts
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = Comment.new  # Isso cria uma instância vazia para o formulário de comentário
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path, notice: 'Post criado com sucesso.'
    else
      render json: @post
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post atualizado com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post excluído com sucesso.'
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :category, :user_id)
  end
end
