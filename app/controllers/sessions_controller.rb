class SessionsController < ApplicationController
  def login
    sign_out
  end

  def create
    company = Company.find_by_email(params[:session][:email])

    if company && company.authenticate(params[:session][:password])
      sign_in company
      redirect_to '/welcome'
    else
      flash.now[:error] = 'Invalid data'
      render 'login'
    end
  end

  def logout
    sign_out
    redirect_to root_path
  end

end
