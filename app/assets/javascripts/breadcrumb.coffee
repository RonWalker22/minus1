breadcrumb = (controller) ->
  strategy_li = document.querySelector '#breadcrumb-strategy'
  objective_li = document.querySelector '#breadcrumb-objective'
  recipe_li = document.querySelector '#breadcrumb-recipe'
  direction_li = document.querySelector '#breadcrumb-direction'
  ingredient_li = document.querySelector '#breadcrumb-ingredient'
  game_li = document.querySelector '#breadcrumb-game'
  switch controller
    when "strategies" 
      strategy_li.classList.add 'is-active'
    when "games" 
      game_li.classList.add 'is-active'
    when "objectives"
      objective_li.classList.add 'is-active'
    when "recipes"
      recipe_li.classList.add 'is-active'
    when "directions"
      direction_li.classList.add 'is-active'
    when "ingredients"
      ingredient_li.classList.add 'is-active'

document.addEventListener 'turbolinks:load', -> 
  body = document.querySelector('body')
  action = body.className.split(" ")[1]
  if action == "show" || action == "new" || action == "edit"
    controller = body.className.split(" ")[0]
    breadcrumb(controller)
  else if action == "index" && strategies = body.className.split(" ")[0]
    strategies_li = document.querySelector '#breadcrumb-strategies'
    strategies_li.classList.add 'is-active'