module TasksHelper
  def choose_show_or_update
    if action_name == 'update' || action_name == 'edit' 
      student_show_path
    elsif action_name == 'show'
      task_path
    end
  end
end
