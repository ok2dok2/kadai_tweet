class PostsController < ApplicationController
  def index
    @post = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(content: params[:post][:content])
    @post.save
    redirect_to posts_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(content: params[:post][:content])
    redirect_to posts_path, notice: "編集完了"
  end

  
end
