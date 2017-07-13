class CalculationsController < ApplicationController
  def flex_square
    # The incoming parameters for this action look like {"a_number"=>"5"}
    # Rails stores that hash in a variable called params
      
    @user_number = params["a_number"].to_i
    @squared_number = @user_number**2
    
    render("calculations/flexible_square_template.html.erb")
  end
  
  def flex_square_root
      
    @user_number = params["a_number"].to_i
    @square_root_number = Math.sqrt(@user_number)
    
    render("calculations/flexible_square_root_template.html.erb")
  end
  
  def flex_payment
      
    @user_apr = params["basis_points"].to_f/100
    @user_years = params["number_of_years"].to_i
    @user_present_value = params["present_value"].to_i
    
    @monthly_payment = (@user_present_value*((@user_apr/100/12)*(((1+(@user_apr/12/100))**(@user_years*12))))/(((1+(@user_apr/12/100))**(@user_years*12))-1))
    
    render("calculations/flexible_payment_template.html.erb")
  end
  
  def flex_random
      
    @user_low_bound = params["low_bound"].to_i
    @user_high_bound = params["high_bound"].to_i
    
    @user_random_result = rand(@user_low_bound...@user_high_bound)
    
    # @range = @user_high_bound - @user_low_bound
    # @user_random_range = rand(@range)
    # @user_random_result = @user_random_range + @user_low_bound
    
    render("calculations/flexible_random_template.html.erb")
  end    
  
  def square_form
    
    render("calculations/square_form_template.html.erb")
  end
  
  def process_square
    
    @user_number = params["the_user_number"].to_f
    @squared_number = @user_number**2
    
    render("calculations/square_results_template.html.erb")
  end
  
  def square_root_form
    
    render("calculations/square_root_form_template.html.erb")
  end
  
  def process_square_root
    
    @user_number = params["the_user_number"].to_f
    @square_root_number = Math.sqrt(@user_number)
    
    render("calculations/square_root_results_template.html.erb")
  end
  
  def payment_form
    
    render("calculations/payment_form_template.html.erb")
  end
  
  def process_payment
    
    @user_apr = params["user_apr"].to_f
    @user_years = params["user_years"].to_i
    @user_present_value = params["user_principal"].to_i
    
    @monthly_payment = (@user_present_value*((@user_apr/100/12)*(((1+(@user_apr/12/100))**(@user_years*12))))/(((1+(@user_apr/12/100))**(@user_years*12))-1)) 
      
    render("calculations/payment_results_template.html.erb")  
  end
  
  def random_form
      
    render("calculations/random_form_template.html.erb")
  end      
  
  def process_random
      
    @user_low_bound = params["low_bound"].to_f
    @user_high_bound = params["high_bound"].to_f
    
    @user_random_result = rand(@user_low_bound...@user_high_bound)
    
    render("calculations/random_results_template.html.erb")
  end
  
end