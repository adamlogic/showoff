class MockupsController < ApplicationController
  
  def frameset
    render :layout => false
  end

  def index
    @entries = ActiveSupport::OrderedHash.new

    Dir.glob File.join(Rails.root, 'app', 'views', 'mockups', '**', '[^_]*.html.*') do |template|
      parent_dir = File.dirname(template).split(/[\/]/).last
      template_name = File.basename(template).split('.').first

      if parent_dir == 'mockups'
        @entries[template_name] = nil
      else
        (@entries[parent_dir] ||= []) << template_name
      end
    end

    # @pages = template_files.map { |f| f.scan(/mockups\/([^.]+)/).flatten.first }

    render :layout => false
  end

  def show
    template_path = File.join(['mockups', params[:parent_dir], params[:template_name]].compact)
    render :template => template_path, :layout => extract_layout(template_path)
  end

  private

    def extract_layout(template_path)
      full_path = File.join(Rails.root, 'app', 'views', template_path) 
      located_files = Dir.glob("#{full_path}*")

      return true if located_files.empty?

      filename_components = File.basename(located_files[0]).split('.')

      if filename_components[1] == 'html'
        true
      else
        filename_components[1]
      end
    end

end
