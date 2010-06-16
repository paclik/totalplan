class UsersController < ApplicationController
 before_filter :require_user, :only => [:show, :edit, :update]
   before_filter :require_admin, :only => [:new]
  
   def new  
   	   @title="Nový uživatel"
       @user = User.new  
   end  
                                  
  def create  
    unless current_user.admin 
      params[:user][:admin] = false
    end	 
    @user = User.new(params[:user])
    if @user.save  
      flash[:notice] = "Registration successful."  
      redirect_to root_url  
    else  
     render :action => 'new'  
    end  
  end  
  
  def edit  
    @title="Editace současného uživatele"
  	@user = current_user  
  end  
  
    
  def update  
   unless current_user.admin 
     params[:user][:admin] = false
   end	
    @user = current_user  
   if @user.update_attributes(params[:user])  
     flash[:notice] = "Successfully updated profile."  
    redirect_to root_url  
   else  
     render :action => 'edit'  
   end  
    
    
    
  end  
end
