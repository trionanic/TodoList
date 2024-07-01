class Todo < ApplicationRecord

 def get_todo_status 
 
   if (self.completed )
     return "Completed"
   else 
     return "In Progress"
   end
   
   end
  
  
  def complete
 
   self.update({completed: true})
   
   end
   
   
   def self.deleteAllCompleted
   
    Todo.delete_by(completed: true) 
	 
	 end
 
end
