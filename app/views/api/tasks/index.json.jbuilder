tasks = @tasks, :title, :done, :subgoal_id, :id
subgoal = @subgoal, :title
json.merge! subgoal
json.merge! tasks
