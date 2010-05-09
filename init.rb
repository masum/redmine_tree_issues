# -*- coding: utf-8 -*-
require 'redmine'

Redmine::Plugin.register :redmine_tree_issues do
  name 'Redmine Tree Issues plugin'
  author 'masu'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  menu :project_menu, 
       :tree_issues,
        {:controller => 'treeissues',
         :action => 'index'},
       :caption => "チケット(階層)",
       :after => :issues,
       :param => :project_id
  permission :view_tree_issues, { :treeissues => [ :index ] }, :public => false
end
