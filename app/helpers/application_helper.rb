module ApplicationHelper
  def owner?
    @flat.user == current_user
  end
end
