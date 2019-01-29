breadcrumb = (controller) ->
  strategy_li = document.querySelector '#breadcrumb-strategy'
  objective_li = document.querySelector '#breadcrumb-objective'
  recipe_li = document.querySelector '#breadcrumb-recipe'
  ingredient_li = document.querySelector '#breadcrumb-ingredient'
  switch controller
    # when "strategies" 
      # objective_li.style.display = 'none'
      # recipe_li.style.display = 'none'
      # ingredient_li.style.display = 'none'
    when "objectives"
      # recipe_li.style.display = 'none'
      # ingredient_li.style.display = 'none'
      objective_li.classList.add 'is-active'
    when "recipes"
      # ingredient_li.style.display = 'none'
      recipe_li.classList.add 'is-active'
    when "ingredients"
      ingredient_li.classList.add 'is-active'

document.addEventListener 'turbolinks:load', -> 
  body = document.querySelector('body')
  action = body.className.split(" ")[1]
  if action == "show" || action == "new" || action == "edit"
    controller = body.className.split(" ")[0]
    breadcrumb(controller)
