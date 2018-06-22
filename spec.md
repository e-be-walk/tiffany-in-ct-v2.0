# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes)
  User has_many sites
  Site has_many windows
- [x] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)
  Site belongs_to User
  Window belongs_to Site
- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)
  User has_many Windows through Sites
- [X] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)
  Yes, many- refer to window form
- [X] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
  User, Site, and Window must have name. User must also have unique email.
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
  Sites are filterable by number of windows and most recent added
- [x] Include signup (how e.g. Devise)
- [x] Include login (how e.g. Devise)
- [x] Include logout (how e.g. Devise)
  I did not user Devise, I used a form in cooperation with signup, login, logout through users/sessions controller using active record password authentication.
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
  Omniauth- Facebook.
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
  users/1
  sites/1/windows/3
  etc.
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients)
  sites/1/windows/new
- [x] Include form display of validation errors (form URL e.g. /recipes/new)
  using flash and controller conditionals

Confirm:
- [x] The application is pretty DRY
  Used partials for forms, helper methods.
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
