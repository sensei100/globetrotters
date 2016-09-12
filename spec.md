# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes) Destination has many reviews and comments
- [x] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User) A review belongs to a user and to a destination
- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients) users have many destinations through reviews
- [x] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity) reviews include content and a user-assigned rating
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item) most fields have a valid presence validation.  Reviews and comments have a minimum length to ensure quality content
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes) Reviews are sorted by rating in the index view
- [x] Include a nested form writing to an associated model using a custom attribute writer (form URL, model name e.g. /recipe/new, Item) reviews are nested with destinations form
- [x] Include signup (how e.g. Devise) Used Devise gem
- [x] Include login (how e.g. Devise) Used Devise gem
- [x] Include logout (how e.g. Devise) Used Devise gem
- [x] Include third party signup/login (how e.g. Devise/OmniAuth) Facebook omniauth
- [x] Include nested resource show or index (URL e.g. users/2/recipes) Reviews and comments are both nested resources of a destination
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients) destination/:id/reviews/new
- [x] Include form display of validation errors (form URL e.g. /recipes/new) Errors are displayed in a field_with_errors class

Confirm:
- [x] The application is pretty DRY  used before_filter in destination controller, Destination/Review show is shared, several partials
- [x] Limited logic in controllers
- [ ] Views use helper methods if appropriate
- [x] Views use partials if appropriate Most forms use partials, error messages are in a partial