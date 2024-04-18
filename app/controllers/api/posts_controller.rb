module Api
  class PostsController < ApplicationController

    def index
      if params[:user_id].present?
        # If user_id is provided in the params, filter posts by user ID
        user = User.find(params[:user_id])
        posts = user.posts
      else
        # If no user_id, fetch all posts
        posts = Post.all.includes(:user) # Assuming you have a User model associated with Post.
      end
      # app/controllers/api/posts_controller.rb

def destroy
  post = Post.find(params[:id])
  if post.destroy
    render json: { message: "Post deleted successfully" }
  else
    render json: { error: "Failed to delete post" }, status: :unprocessable_entity
  end
end
# app/controllers/api/posts_controller.rb

def update
  post = Post.find(params[:id])
  if post.update(content: params[:content])
    render json: { message: "Post updated successfully" }
  else
    render json: { error: "Failed to update post" }, status: :unprocessable_entity
  end
end



      render json: posts.to_json(include: { user: { only: [:id] } }, methods: :content)
    end
  end
end
