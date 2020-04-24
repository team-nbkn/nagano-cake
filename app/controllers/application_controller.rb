class ApplicationController < ActionController::Base


  def after_sign_in_path_for(resource)
  	case resource
  	when Admin
  	   admins_top_path
    when Costomer
       costomers_products_top_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
  	# case resource
  	# when Admin
    if resource_or_scope == :admin
  	   new_admin_session_path
    # when Costomer
    else
       costomers_products_top_path
    end
  end

end
