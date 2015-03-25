class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new params[:user] # mass-assignment
		if @user.save
			redirect_to @user, :notice => 'Welcome to Colchonet' #flash[:notice] = 'Welcome to Colchonet'
		else
			render :new #using render instead redirect to show error messages and all informations that user written
		end
	end

	def show
		@user = User.find(params[:id]) # @user = User.where(id: params[':id'])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(params[:user])
			redirect_to @user, :notice => "Update was successfuly"
		else
			render :edit
		end
	end

end
