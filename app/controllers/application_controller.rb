class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :logged_in?, except: [:new, :create, :about, :index, :show]
  before_action :current_user, except: [:new, :create, :about, :index, :show]
  helper_method :current_user
  helper_method :validate_user_info

  def logged_in?
    !!current_user
  end

    def current_user
      if session[:user_id]
        @current_user ||= User.find(session[:user_id])
      else
        nil
      end 
    end

    def user_exist
      if params[:user_id] && !User.exists?(params[:user_id])
          render ':welcome/about', message: "User not found"
        end
      end

      def match_user
        if params[:user_id] != current_user.id.to_s
          render ':site/show', message: "User ID authentication failure. You cannot edit other user's information."
        end
      end

      def validate_user_info
        user_exist && match_user
      end
end
