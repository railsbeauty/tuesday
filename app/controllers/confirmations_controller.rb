class ConfirmationsController < Devise::ConfirmationsController
  def show
    @user = User.find_by_confirmation_token(params[:confirmation_token])
  end
 def confirm_user
    @user = User.find_by_confirmation_token(params[:user][:confirmation_token])
    puts "----------------------------------------"
    puts @user.email
    
    if @user.confirmation_token == params[:user][:confirmation_token]   
      puts "=================="
      @user.password = params[:user][:password]
      @user.password_confirmation = params[:user][:password_confirmation]
      @user.save
      puts "User info"
      puts @user.inspect
      set_flash_message :notice, :confirmed
      sign_in_and_redirect("user", @user)
    else
      render :show
    end    
  end
 end
