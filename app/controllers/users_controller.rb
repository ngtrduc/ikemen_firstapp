class UsersController < ApplicationController
  def show
  	@user = User.find_by(:id => params[:id])
  	if @user == current_user
  		redirect_to user_path
  	end
  	if @user.nil?
  		redirect_to root_url
  	else
    @count=@user.image.count
  	@images=@user.image.paginate(page: params[:page], :per_page => 6)
  	end
  end
end
