class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if params[:back]
      render :new
    else
      if @post.save
        redirect_to posts_path, notice: "つぶやきました！"
      else
        render :new
      end
    end
  end

  def edit
  end

  def update
    @post.update(post_params)
    redirect_to posts_path, notice: "編集完了"
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "削除完了"
  end

  def confirm
    @post = Post.new(post_params)
    render :new if @post.invalid?
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

   def post_params
    params.require(:post).permit(:content)
   end
end




