class CommentsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :initialize_project

  def create
    comment = @project.comments.new(comment_params)
    if comment.save
      redirect_to root_path, notice: "Comment added successfully."
    else
      redirect_to root_path, alert: "Failed to comment: #{comment.errors.full_messages.to_sentence}"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def initialize_project
    @project = Project.find(params[:project_id])
    if @project.blank?
      redirect_to root_path, alert: "Project not found"
    end
  end
end