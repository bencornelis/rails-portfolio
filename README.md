# Personal Portfolio

July 10, 2015

##About

A basic web development portfolio site using Rails with the Devise/Pundit gems for
user authentication/authorization.

- visitors can view skills, projects created using those skills, and link to those projects on github
- visitors can view blog posts, sign up for an account, and comment on blog posts
- admins can add/edit/delete skills and projects
- admins can add blog posts

##Installation

Requires Rails and postgres. To use the app, clone the repository, then run the following

* `bundle`
* `rake db:create`
* `rake db:migrate`
* `rails s`
