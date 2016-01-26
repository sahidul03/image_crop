class UsersController < ApplicationController

  def index
    @user=User.new
    @users=User.all
  end

  def create
    @user=User.new(user_params)
    if @user.save
      if params[:user][:photo].present?
        render :crop  ## Render the view for cropping
      else
        redirect_to users_path
      end

    else
      @users=User.all
      render 'index'
    end
  end

  def image_save
    @user=User.find(params[:user][:id])
    if @user.update(params_cover_photo)
      redirect_to users_path
    else

    end
  end

  def update
    @user=User.find(params[:id])
    if @user.update(user_params)
      if params[:user][:photo].present?
        render :crop
      else
        redirect_to users_path
      end
    else
      @users=User.all
      render 'index'
    end
  end

  protected
  def user_params
    params.require(:user).permit(:first_name,:last_name,:photo,:photo_crop_x, :photo_crop_y, :photo_crop_w, :photo_crop_h)
  end
  def params_cover_photo
    params.require(:user).permit(:photo, :crop_x, :crop_y, :crop_w, :crop_h)
  end
end
