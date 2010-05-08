ActionController::Routing::Routes.draw do |map|
  map.with_options :controller => 'treeissues' do |treeissues|
    treeissues.connect 'projects/:project_id/treeissues', :action => 'index'
    treeissues.connect 'projects/:project_id/treeissues/:action/:parent_id'
    treeissues.connect 'projects/:project_id/treeissues/:action/:parent_id/:indent'
  end
end
