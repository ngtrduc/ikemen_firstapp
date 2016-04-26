class StaticPagesController < ApplicationController
  def home
    @duc=User.first
    @anh=User.find(2)
    @kien=User.find(3)
    @hong=User.find(4)
    @chuan=User.find(5)
    @tung=User.find(6)
  end

  def help
  end
  def user
    @count=current_user.image.count
  	@images=current_user.image.paginate(page: params[:page], :per_page => 6)
  end
  def mien_bac
  	@images = Image.where(:place =>"mien_bac").paginate(page: params[:page], :per_page => 6)
  end
  def mien_trung
  	@images = Image.where(:place =>"mien_trung").paginate(page: params[:page], :per_page => 6)
  end
  def mien_nam
  	@images = Image.where(:place =>"mien_nam").paginate(page: params[:page], :per_page => 6)
  end
  def search
    if params[:search_by] == '1'
    @images = Image.where("title like ?", "%#{params[:search]}%").paginate(page: params[:page], :per_page => 6)
    @users = nil
    end
    if params[:search_by] == '2'
    @users=  User.where("name like ?", "%#{params[:search]}%")
    @images=nil
    end
  end
end
