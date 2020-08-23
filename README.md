# README

GitHub URL: https://github.com/grafail/COM2027_Group17

In order to run this project the following commands should be run:
```
rails db:migrate  
rake db:seed  
rails server
```

In order to run some tests (system tests), chromium (e.g. Google Chrome) may be required.

This project is a system management system (like self-service).

[Tabulator](http://tabulator.info/) was used for the tables in the index views.   
Scripts using JQuery and AJAX were used to link it to the database.  
Some of the columns in the table are used only to display info about a foreign key. All the editable columns of the model are marked with an asterisk at their column name (althougth a user may not be able to edit them because of their role even if it is there).

For the new item modal [Micromodal.js](https://micromodal.now.sh) was used.  
To validate input within the [jQuery Validation Plugin](https://jqueryvalidation.org/) was used.  
For the notifications [toastr](https://github.com/CodeSeven/toastr) was used to replace the default flash messages.  
For the user capabilities [Devise](https://github.com/heartcombo/devise) with [rolify](https://github.com/RolifyCommunity/rolify) for the roles is used.


The default edit, show and new views are not included as this functionalities are covered within the tables in the index view.

The are multiple roles available:

Student:
* Each student can have a course assigned, but they are allowed not to be enrolled to one
* Each student is able to enroll to subjects
* The subject enrollment menu only shows subjects from the course the student has enrolled
* A student can review his own information

Staff:
* This role is meant to be used by lecturers
* Staff users are assigned to subjects as lecturers
* Staff can assign grades
* Staff can edit subject information (not remove them)

Admin:
* The can manage every aspect of every model of the project
* They are the only ones who can create new users
* They have access to every page of the project

As only admins can create new users some default accounts are provided:

Student Account: 
* Email: staff@example.org
* Password: 123456

Staff Account: 
* Email: student@example.org
* Password: 123456

Admin Account: 
* Email: admin@example.org
* Password: 123456
