module SessionsHelper
  def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.encrypt(remember_token))
    self.current_user = user
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    remember_token = User.encrypt(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end

  def current_user?(user)
    user == current_user
  end

  def admin?
    if signed_in?
      email = current_user.email.downcase
      CONFIG['admin_emails'] && CONFIG['admin_emails'].include?(email)
    end
  end

  def admin_require
    if !admin?
      redirect_to root_path
    end
  end

  def signed_in?
    !current_user.nil?
  end

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to login_url, notice: "Please sign in."
    end
  end

  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    fullpath =  request.fullpath
    session[:return_to] = fullpath if request.get?
    if request.post? && fullpath.match(/\/microposts\/\d+\/comments/)
      session[:return_to] = fullpath.match(/\/microposts\/\d+/).to_s
      session[:comment_body] = request.params[:comment][:content]
    end
  end

  def writed_comments
    #call in comments/form
    session[:comment_body]
  end

  def delete_writed_comments
    #call in comments/form
    session.delete(:comment_body)
  end

end
