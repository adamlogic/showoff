class MockupsController < ApplicationController
  unloadable

  LAYOUTS = Dir.glob(File.join(Rails.root, 'app', 'views', 'layouts', '*.html.*')).map do |file|
    File.basename(file).split('.').first
  end
  
  def frameset
    render :layout => false
  end

  def index
    @entries = []
    @directories = ActiveSupport::OrderedHash.new

    Dir.glob File.join(Rails.root, 'app', 'views', 'mockups', '**', '[^_]*.html*') do |template|
      parent_dir = File.dirname(template).split(/[\/]/).last
      template_name = File.basename(template).split('.').first

      if parent_dir == 'mockups'
        @entries << template_name
      else
        (@directories[parent_dir] ||= []) << template_name
      end
    end

    render :layout => false
  end

  def show
    session[:template_name] = params[:template_name]
    session[:parent_dir]    = params[:parent_dir]
    template_path = File.join(['mockups', params[:parent_dir], params[:template_name]].compact)
    render :template => template_path, :layout => determine_layout
  end

  private

    def determine_layout
      directory = params[:parent_dir].to_s.downcase
      LAYOUTS.include?(directory) ? directory : true
    end

end
