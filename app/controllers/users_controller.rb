class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user]) # mass-assignment
		if @user.save
			redirect_to @user, :notice => 'Welcome to Colchonet'
		else
			render :new
		end
	end
end
