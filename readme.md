[![Code Climate](https://codeclimate.com/github/vpatel90/rr_mvc_html/badges/gpa.svg)](https://codeclimate.com/github/vpatel90/rr_mvc_html)

# Request / Response MVC! To-Do List


* Run the server with `ruby bin/server.rb`
  * Please note: The server will need to be restarted every time you change your code.

* You can use the Postman app for any requests that are not `GET` requests.
* All `GET` requests can be displayed directly in the browser by navigating to the URL requested.
* If the type of the request is not specified, it can be assumed to be `GET`.
* Highly recommended to use `GET` requests through a browser

	![Image of Home Page](http://i.imgur.com/dwqahqr.png?1 =450x)



## Sending a Request

### GET
* `http://localhost:3001/` or `http://localhost:3001/tasks`Returns all tasks separated
* `http://localhost:3001/tasks/1` Returns task with that ID
* `http://localhost:3001/tasks/9999999` Returns 404
* `http://localhost:3001/tasks?search=go` Returns tasks which contain that string / accomplished by using the search field
* `http://localhost:3001/tasks/incomplete` Returns all incomplete tasks
* `http://localhost:3001/tasks/complete` Returns all complete tasks

### DELETE
* `http://localhost:3001/tasks/1` Deletes task at given ID

### POST
* `http://localhost:3001/tasks` Adds a task with a given body `body: "go to sleep"`

### PUT
* `http://localhost:3000/tasks/1` Modifies a task with a given body `'body: "something else"`

### Other Features
* Complete buttons next to each incomplete task will mark them as complete
* adding .json to GET requests will return JSON objects
