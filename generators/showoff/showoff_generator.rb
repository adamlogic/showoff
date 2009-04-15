class ShowoffGenerator < Rails::Generator::Base
  def manifest
    record do |m|
      m.directory 'app/views/mockups/sample_section'
      m.file 'sample_mockup.html.erb', 'app/views/mockups/sample_mockup.html.erb'
      m.file 'alternate_layout.html.erb.alternate', 'app/views/mockups/alternate_layout.html.erb.alternate'
      m.file 'sample_nested.html.erb', 'app/views/mockups/sample_section/sample_nested.html.erb'
      m.file 'showoff.css', 'public/stylesheets/showoff.css'
    end
  end
end
