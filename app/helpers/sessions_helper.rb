module SessionsHelper
  def sign_in(company)
    cookies.permanent[:remember_token] = company.remember_token
    self.current_company = company
  end

  def sign_out
    if self.current_company
      self.current_company.remember_token = nil
      self.current_company.save
      self.current_company = nil
    end
    cookies.delete(:remember_token)
  end

  def signed_in?
    !current_company.nil?
  end

  def current_company=(company)
    @current_company = company
  end

  def current_company
    @current_company ||= Company.find_by_remember_token(cookies[:remember_token])
  end

  def current_company?(company)
    company == current_company
  end
end
