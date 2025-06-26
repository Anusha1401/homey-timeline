class ProjectTimelineBuilder
  def initialize(project)
    @project = project
  end

  def timeline_items
    Rails.logger.info "1" * 100
    Rails.logger.info @project.comments
    Rails.logger.info comments
    Rails.logger.info status_changes
    Rails.logger.info "1" * 100
    (comments + status_changes).sort_by { |item| item[:created_at] }
  end

  private

  def comments
    @project.comments.map do |comment|
      {
        type: 'comment',
        user: comment.user_name,
        message: comment.body,
        created_at: comment.created_at
      }
    end
  end

  def status_changes
    @project.status_changes.map do |status|
      {
        type: 'status_change',
        user: status.user_name,
        message: "Changed status to #{status.status}",
        created_at: status.created_at
      }
    end
  end
end
