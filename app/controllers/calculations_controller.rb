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
      
    @user_apr = params["basis_points"].to_i/100
    @user_years = params["number_of_years"].to_i
    @user_present_value = params["present_value"].to_i
    
    @monthly_payment = (@user_present_value*((@user_apr/12)*(((1+(@user_apr/12))**(@user_years*12))))/(((1+(@user_apr/12))**(@user_years*12))-1))
    
    render("calculations/flexible_payment_template.html.erb")
  end
  
  def square_form
    
    render("calculations/square_form_template.html.erb")
  end
  
   def process_square
    
    @user_number = params["the_user_number"].to_i
    @squared_number = @user_number**2
    
    render("calculations/square_results_template.html.erb")
  end
  
  
  
end