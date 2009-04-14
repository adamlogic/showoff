ActionController::Routing::Routes.draw do |map|
  map.with_options :controller => 'mockups' do |mockups|
    mockups.mockups '/mockups', :action => 'frameset'
    mockups.mockups_index '/mockups_index', :action => 'index'
    mockups.mockup '/mockup/:template_name', :action => 'show'
  end
end
