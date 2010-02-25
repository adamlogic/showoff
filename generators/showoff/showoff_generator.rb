class ShowoffGenerator < Rails::Generator::Base
  def manifest
    record do |m|
      m.directory 'app/views/mockups/basic'

      m.file 'sample_mockup.html.erb', 'app/views/mockups/sample_mockup.html.erb'
      m.file 'alternate_layout.html.erb', 'app/views/mockups/basic/alternate_layout.html.erb'
      m.file 'showoff.css', 'public/stylesheets/showoff.css'
    end
  end
end
