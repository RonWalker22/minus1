# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

document.addEventListener 'turbolinks:load', -> 
  body = document.querySelector('body')
  if(body.className == "recipes show")
    modal = document.querySelector '.modal'
    close_modal_btn = document.querySelector '.close-btn'
    modal_background = document.querySelector '.modal-background'
    new_ingredient_btn = document.querySelector '.new-ingredient-btn'
    new_direction_btn = document.querySelector '.new-direction-btn'
    ingredient_form = document.querySelector '.ingredient-form'
    direction_form = document.querySelector '.direction-form'
    form_title = document.querySelector '.modal-card-title'

    new_ingredient_btn.addEventListener 'click', ->
      modal.classList.add 'is-active'
      direction_form.classList.add 'hide'
      ingredient_form.classList.remove 'hide'
      form_title.innerHTML = 'New Ingredient'
    new_direction_btn.addEventListener 'click', ->
      modal.classList.add 'is-active'
      ingredient_form.classList.add 'hide'
      direction_form.classList.remove 'hide'
      form_title.innerHTML = 'New Direction'
    modal_background.addEventListener 'click', ->
      modal.classList.remove 'is-active'
    close_modal_btn.addEventListener 'click', ->
      modal.classList.remove 'is-active'

