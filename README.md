
Model => write methods to interact with DB, servers, manipulate data as needed
View => Render HTML, anything we see on a browser
Controller => Interaction in between both of the above, recieves requests and responds as necessary

Create
Read 
Update
Delete/Destroy
Data

RESTful Routes

HTTP Verb      |   Route      |   Action   |   Used For
GET                /todos         index       displaying all todos
GET               /todos/:id      show         displaying detailed todo
GET               /todos/new      new     displaying a form to create todo
POST              /todos          create        actually makes the todo
GET              /todos/:id/edit    edit    displaying a form to edit todo
PATCH/PUT        /todos/:id        update       update the db accordingly
DELETE           /todos/:id        destroy      deletes the todo 
