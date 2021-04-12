package dk.jarry.todo.boundary;

import java.util.List;

import javax.inject.Inject;
import javax.ws.rs.DELETE;
import javax.ws.rs.DefaultValue;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.QueryParam;

import org.eclipse.microprofile.openapi.annotations.Operation;
import org.eclipse.microprofile.openapi.annotations.tags.Tag;

import dk.jarry.todo.entity.ToDo;



@Path("/todos")
@Tag(name = "Todo Resource", description = "All Todo Operations")
public class ToDoResource {

    @Inject
	ToDoService toDoService;

	@POST
	@Operation(description = "Create a new todo")
	public ToDo create(ToDo toDo) {
		return toDoService.create(toDo);
	}

	@GET
	@Path("{id}")
	@Operation(description = "Get a specific todo by id")
	public ToDo read(@PathParam("id") Long id) {
		return toDoService.read(id);
	}

	@PUT
	@Path("{id}")
	@Operation(description = "Update an exiting todo")
	public ToDo update(@PathParam("id") Long id, ToDo toDo) {
		return toDoService.update(id, toDo);
	}

	@DELETE
	@Path("{id}")
	@Operation(description = "Delete a specific todo by id")
	public void delete(@PathParam("id") Long id) {
		toDoService.delete(id);
	}

	@GET
	@Path("/load")
	@Operation(description = "Creates test todos - default is 100 todos")
	public List<ToDo> load(@DefaultValue("100") @QueryParam("count") Integer count) {
		return toDoService.load(count);
	}

	@GET
	@Operation(description = "Get a list of todos")
	public List<ToDo> list( //
		@DefaultValue("0") @QueryParam("from") Integer from, //
		@DefaultValue("100") @QueryParam("limit") Integer limit) {
		return toDoService.list(from, limit);
	}

}