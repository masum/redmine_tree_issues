class TreeissuesController < ApplicationController
  before_filter :find_project

  def index
  end

  def children
    render :layout => false unless params[:parent_id].nil?
  end

  def find_project
    @project = Project.find(params[:project_id])
   
    @issues = @project.issues.find_all_by_parent_id(params[:parent_id])
    @arIssues = []
    @issues.map {|issue|
      pid=issue.id
      children = @project.issues.find_all_by_parent_id(pid)
      item = {}
      item['children'] = children.size
      item['issue'] = issue;
      @arIssues << item
    }
  end
end
