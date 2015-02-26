module AdminModule

  def if_admin
    if current_user
      if !current_user.admin?
      	flash[:error] = "No premission"
        redirect_to new_user_session_path
      end  
    else		
      flash[:error] = "No premission"
      redirect_to new_user_session_path
    end     
  end
  
end