require "test_helper"

class TodoTest < ActiveSupport::TestCase

   setup do 
   puts(" I run before the test")
   @todo = Todo.new()
   
   end
   
   teardown do
   puts ("I run after the test")
   @todo.destroy()
   end
   
  test "the truth" do
     assert true
    end
	
	test "save a todo" do
	

	 assert @todo.save
	 end
	 
	 # test "test for false" do
	
	 # todo = Todo.new
	 # assert false
	 # end
	 
	 test "find todo" do 

	   @todo.title = "Find the cat"
	   @todo.completed = false
	   @todo.save
	   expected_todo = Todo.find(@todo.id)
	   assert_equal(expected_todo.title, @todo.title)
	   assert_equal(expected_todo.completed, @todo.completed)
	   assert_equal(expected_todo.id, @todo.id)
	 end
	 
	 test "delete todo" do
	
	 @todo.save 
	 assert_difference("Todo.count", -1) do
	   @todo.destroy
	   end 
	 
	 end
	 
	 test "Update todo " do
	 cat_todo  = todos(:cat_task)
	 cat_todo_newTitle = "Feed Misty"
	 cat_todo.update({title:cat_todo_newTitle}) 
	 assert_equal(cat_todo_newTitle, cat_todo.title )
	 end
	 
	 test "in progress status" do
	   cat_todo = todos(:cat_task)
	   cat_todo.update({completed:false})
	   assert_equal("In Progress",cat_todo.get_todo_status())
	 
	 end
	 
	 
	  test "complete" do
	   cat_todo = todos(:cat_task)
	   cat_todo.update({completed:false})
	   assert_equal("In Progress",cat_todo.get_todo_status())
	   cat_todo.complete()
	   assert_equal("Completed", cat_todo.get_todo_status())
	 
	 end
	 
	 
	 test "delete_completed" do
	  
	  cat_todo = todos(:cat_task)
	  fish_todo = todos(:fish_task)
	  my_todo = Todo.new()
	  my_todo.update ({title: "Complete this one" , completed: true })
	   my_todo2 = Todo.new()
	  my_todo2.update ({title: "Dont complete this too" , completed: false })
	   my_todo3 = Todo.new()
	  my_todo3.update ({title: "Dont complete this three" , completed: false })
	  fish_todo.complete()
	  assert_difference("Todo.count" ,-3 ) do
	  Todo.deleteAllCompleted()
	  end
	  end
	 
	 

	 
	
	 
end
