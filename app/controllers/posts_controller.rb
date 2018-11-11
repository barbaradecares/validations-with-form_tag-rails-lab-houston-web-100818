class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create 
    @post = Post.new(post_params)
    if @post.valid?
      @post.save
      redirect_to post_path(@post)
    else 
      redirect_to new_post_path
    end
  end 

  def new
    @post = Post.new
  end 

  def update
    @post = Post.find(params[:id])
    @post.assign_attributes(post_params)
    if @post.valid?
      @post.save
      redirect_to post_path(@post)
    else 
      render :edit
    end 
  end

  private

  def post_params
    params.permit(:title, :category, :content)
  end
end
