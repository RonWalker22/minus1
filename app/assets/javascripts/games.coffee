# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

document.addEventListener 'turbolinks:load', -> 
  body = document.querySelector('body')
  if(body.className == "games show")
    modal = document.querySelector '.modal'
    close_modal_btn = document.querySelector '.close-btn'
    modal_background = document.querySelector '.modal-background'
    new_mode_btn = document.querySelector '.new-mode-btn'
    new_level_btn = document.querySelector '.new-level-btn'
    new_character_btn = document.querySelector '.new-character-btn'
    new_respawn_btn = document.querySelector '.new-respawn-btn'
    new_location_btn = document.querySelector '.new-location-btn'
    new_loadout_btn = document.querySelector '.new-loadout-btn'
    mode_form = document.querySelector '.mode-form'
    level_form = document.querySelector '.level-form'
    loadout_form = document.querySelector '.loadout-form'
    respawn_form = document.querySelector '.respawn-form'
    character_form = document.querySelector '.character-form'
    location_form = document.querySelector '.location-form'
    form_title = document.querySelector '.modal-card-title'

    new_mode_btn.addEventListener 'click', ->
      loadout_form.classList.add 'hide'
      modal.classList.add 'is-active'
      location_form.classList.add 'hide'
      level_form.classList.add 'hide'
      mode_form.classList.remove 'hide'
      respawn_form.classList.add 'hide'
      character_form.classList.add 'hide'
      form_title.innerHTML = 'New Mode'
    new_location_btn.addEventListener 'click', ->
      loadout_form.classList.add 'hide'
      modal.classList.add 'is-active'
      level_form.classList.add 'hide'
      location_form.classList.remove 'hide'
      mode_form.classList.add 'hide'
      respawn_form.classList.add 'hide'
      character_form.classList.add 'hide'
      form_title.innerHTML = 'New Location'
    new_level_btn.addEventListener 'click', ->
      loadout_form.classList.add 'hide'
      modal.classList.add 'is-active'
      location_form.classList.add 'hide'
      level_form.classList.remove 'hide'
      mode_form.classList.add 'hide'
      respawn_form.classList.add 'hide'
      character_form.classList.add 'hide'
      form_title.innerHTML = 'New Level'
    new_respawn_btn.addEventListener 'click', ->
      loadout_form.classList.add 'hide'
      modal.classList.add 'is-active'
      location_form.classList.add 'hide'
      level_form.classList.add 'hide'
      mode_form.classList.add 'hide'
      respawn_form.classList.remove 'hide'
      character_form.classList.add 'hide'
      form_title.innerHTML = 'New Respawn'
    new_loadout_btn.addEventListener 'click', ->
      modal.classList.add 'is-active'
      location_form.classList.add 'hide'
      level_form.classList.add 'hide'
      mode_form.classList.add 'hide'
      respawn_form.classList.add 'hide'
      loadout_form.classList.remove 'hide'
      character_form.classList.add 'hide'
      form_title.innerHTML = 'New loadout'
    new_character_btn.addEventListener 'click', ->
      loadout_form.classList.add 'hide'
      modal.classList.add 'is-active'
      location_form.classList.add 'hide'
      level_form.classList.add 'hide'
      mode_form.classList.add 'hide'
      respawn_form.classList.add 'hide'
      character_form.classList.remove 'hide'
      form_title.innerHTML = 'New Character'
    modal_background.addEventListener 'click', ->
      modal.classList.remove 'is-active'
    close_modal_btn.addEventListener 'click', ->
      modal.classList.remove 'is-active'

