class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  def index 
    @posts = Post.all.order("id DESC").page(params[:page]).per(15)
  end

  def show

  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        flash[:success] = "Post was successfully created."
        format.html { redirect_to posts_url }
        format.json { render :show, status: :created, location: @post }
      else
        flash[:error] = @post.errors.full_messages.to_sentence
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def edit
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        flash[:success] = "Post was successfully updated."
        format.html { redirect_to posts_url }
        format.json { render :show, status: :ok, location: @post }
      else
        flash[:error] = @post.errors.full_messages.to_sentence
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy!

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { render json: {message: "success"}, status: :ok }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render file: "#{Rails.root}/public/404.html", status: :not_found
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :description, :is_public, :category_id)
    end
end
