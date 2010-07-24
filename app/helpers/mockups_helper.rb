module MockupsHelper
  def mockup_path_from_session
    if session[:parent_dir]
      mockup_path(session[:template_name], :parent_dir => session[:parent_dir])
    elsif session[:template_name]
      mockup_path(session[:template_name])
    end
  end
end
