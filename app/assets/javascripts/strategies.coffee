# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

table_switch = ->
  index_tabel = document.querySelector '#index-tabel'
  personal_tabel = document.querySelector '#personal-tabel'
  team_tabel = document.querySelector '#team-tabel'
  index_btn = document.querySelector '#index-btn'
  personal_btn = document.querySelector '#personal-btn'
  team_btn = document.querySelector '#team-btn'

  index_btn.addEventListener 'click', ->
    index_btn.parentNode.classList.add 'is-active'
    team_btn.parentNode.classList.remove 'is-active'
    personal_btn.parentNode.classList.remove 'is-active'
    index_tabel.style.display = 'inline-table'
    team_tabel.style.display = 'none'
    personal_tabel.style.display = 'none'
  team_btn.addEventListener 'click', ->
    index_btn.parentNode.classList.remove 'is-active'
    team_btn.parentNode.classList.add 'is-active'
    personal_btn.parentNode.classList.remove 'is-active'
    index_tabel.style.display = 'none'
    team_tabel.style.display = 'inline-table'
    personal_tabel.style.display = 'none'
  personal_btn.addEventListener 'click', ->
    index_btn.parentNode.classList.remove 'is-active'
    team_btn.parentNode.classList.remove 'is-active'
    personal_btn.parentNode.classList.add 'is-active'
    index_tabel.style.display = 'none'
    team_tabel.style.display = 'none'
    personal_tabel.style.display = 'inline-table'

document.addEventListener 'turbolinks:load', -> 
  body = document.querySelector('body')
  if(body.className == "strategies index" ||  body.className == "rooms index")
    table_switch()
    body = document.querySelector('body')
  if(body.className == "strategies index")
    modal = document.querySelector '.modal'
    close_modal_btn = document.querySelector '.close-btn'
    modal_background = document.querySelector '.modal-background'
    new_strategy_btn = document.querySelector '.new-strategy-btn'

    new_strategy_btn.addEventListener 'click', ->
      modal.classList.add 'is-active'
    modal_background.addEventListener 'click', ->
      modal.classList.remove 'is-active'
    close_modal_btn.addEventListener 'click', ->
      modal.classList.remove 'is-active'
   
  if(body.className == "strategies show")
    modal = document.querySelector '.modal'
    close_modal_btn = document.querySelector '.close-btn'
    modal_background = document.querySelector '.modal-background'
    new_objective_btn = document.querySelector '.new-objective-btn'

    new_objective_btn.addEventListener 'click', ->
      modal.classList.add 'is-active'
    modal_background.addEventListener 'click', ->
      modal.classList.remove 'is-active'
    close_modal_btn.addEventListener 'click', ->
      modal.classList.remove 'is-active'
