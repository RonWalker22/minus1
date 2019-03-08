# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
document.addEventListener 'turbolinks:load', -> 
  body = document.querySelector('body')
  if(body.className == "objectives show")
    modal = document.querySelector '.modal'
    close_modal_btn = document.querySelector '.close-btn'
    modal_background = document.querySelector '.modal-background'
    new_recipe_btn = document.querySelector '.new-recipe-btn'

    new_recipe_btn.addEventListener 'click', ->
      modal.classList.add 'is-active'
    modal_background.addEventListener 'click', ->
      modal.classList.remove 'is-active'
    close_modal_btn.addEventListener 'click', ->
      modal.classList.remove 'is-active'
