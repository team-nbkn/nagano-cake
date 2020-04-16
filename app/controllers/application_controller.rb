class ApplicationController < ActionController::Base


  def after_sign_in_path_for(resource)
  	case resource
  	when Admin
  	   admins_top_path
    when Costomer
       costomers_products_top_path
    end
  end

  def after_sign_out_path_for(resource)
  	case resource
  	when Admin
  	   new_admin_session_path
    when Costomer
       costomers_products_top_path
    end
  end

end
