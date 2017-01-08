class PostsController < ApplicationController

	before_action :post_find, only: [:show, :edit, :update, :destroy]

	def index
		@posts = Post.all
	end

  	def show
  	end

	def new
		@post = current_user.posts.build
	end

	def edit
	end

	def create
		@post = current_user.posts.new(post_params)

		if @post.save
		redirect_to @post, success: 'Задача создана'
		else
		render 'new', info: 'Задача не создана'
		end
	end

	def update
		if @post.update(post_params)
		redirect_to @post, success: 'Задача обновлена'
		else
		render 'edit', danger: 'Задача не обновлена'	
		end	
	end

	def destroy
		@post.destroy
		redirect_to posts_path, danger: 'Задача удалена'
	end

	private

	def post_find
		@post = Post.find(params[:id])
	end

  	def post_params
    	params.require(:post).permit(:title, :body, :email, :user_id)
  	end

end
