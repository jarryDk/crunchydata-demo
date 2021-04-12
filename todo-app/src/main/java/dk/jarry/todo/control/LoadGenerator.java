package dk.jarry.todo.control;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import dk.jarry.todo.entity.ToDo;

public class LoadGenerator {
	
	private LoadGenerator() {	
	}
	
	public static LoadGenerator getInstance() {
		return new LoadGenerator();
	}
	
	public List<ToDo> generateToDos(Integer count){
		List<ToDo> todos = new ArrayList<>(count);		
		for( int i = 0 ; i < (count > 0 ? count:100) ; i++) {
			todos.add(generateToDo());
		}		
		return todos;
	}
	
	private ToDo generateToDo() {
		ToDo todo = new ToDo();		
		todo.subject = "Subject - " + UUID.randomUUID().toString();
		todo.body = "Body - " + UUID.randomUUID().toString();		
		return todo;
	}

}
