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
    ingredient_select = document.querySelector '#ingredient-options-select'
    character_select = document.querySelector '#character-options-select'
    respawn_select = document.querySelector '#respawn-options-select'
    loadout_select = document.querySelector '#loadout-options-select'
    primary_select = document.querySelector '#primary-options-select'
    secondary_select = document.querySelector '#secondary-options-select'
    sight_select = document.querySelector '#sight-options-select'
    grip_select = document.querySelector '#grip-options-select'
    attachment_select = document.querySelector '#attachment-options-select'
    utility_select = document.querySelector '#utility-options-select'
    parent_select = document.querySelector '#parent-options-select'
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

    ingredient_select.addEventListener 'change', ->
      switch this.value
        when 'Loadout' 
          loadout_select.parentNode.parentNode.classList.remove 'hide'
          respawn_select.classList.add 'hide'
          character_select.classList.add 'hide'
        when 'Respawn' 
          loadout_select.parentNode.parentNode.classList.add 'hide'
          loadout_select.parentNode.parentNode.required = false;
          character_select.classList.add 'hide'
          character_select.required = false;
          respawn_select.classList.remove 'hide'
          respawn_select.required = true;
          primary_select.classList.add 'hide'
          primary_select.required = false;
          secondary_select.classList.add 'hide'
          secondary_select.required = false;
          sight_select.classList.add 'hide'
          sight_select.required = false;
          grip_select.classList.add 'hide'
          grip_select.required = false;
          attachment_select.classList.add 'hide'
          attachment_select.required = false;
          utility_select.classList.add 'hide'
          utility_select.required = false;
        when 'Character' 
          loadout_select.parentNode.parentNode.classList.add 'hide'
          loadout_select.parentNode.parentNode.classList.required = false;
          character_select.classList.remove 'hide'
          character_select.classList.required = true;
          respawn_select.classList.add 'hide'
          respawn_select.classList.required = false;
          primary_select.classList.add 'hide'
          primary_select.classList.required = false;
          secondary_select.classList.add 'hide'
          secondary_select.classList.required = false;
          sight_select.classList.add 'hide'
          sight_select.classList.required = false;
          grip_select.classList.add 'hide'
          grip_select.classList.required = false;
          attachment_select.classList.add 'hide'
          attachment_select.classList.required = false;
          utility_select.classList.add 'hide'
          utility_select.classList.required = false;
    
    loadout_select.addEventListener 'change', ->
      switch this.value
        when 'Primary'
          parent_select.classList.add 'hide'          
          primary_select.classList.remove 'hide'
          secondary_select.classList.add 'hide'
          sight_select.classList.add 'hide'
          grip_select.classList.add 'hide'
          attachment_select.classList.add 'hide'
          utility_select.classList.add 'hide'
        when 'Secondary'
          parent_select.classList.add 'hide' 
          primary_select.classList.add 'hide'
          secondary_select.classList.remove 'hide'
          sight_select.classList.add 'hide'
          grip_select.classList.add 'hide'
          attachment_select.classList.add 'hide'
          utility_select.classList.add 'hide'
        when 'Sight'
          parent_select.classList.remove 'hide' 
          primary_select.classList.add 'hide'
          secondary_select.classList.add 'hide'
          sight_select.classList.remove 'hide'
          grip_select.classList.add 'hide'
          attachment_select.classList.add 'hide'
          utility_select.classList.add 'hide'
        when 'Grip'
          parent_select.classList.remove 'hide' 
          primary_select.classList.add 'hide'
          secondary_select.classList.add 'hide'
          sight_select.classList.add 'hide'
          grip_select.classList.remove 'hide'
          attachment_select.classList.add 'hide'
          utility_select.classList.add 'hide'
        when 'Attachment'
          parent_select.classList.remove 'hide' 
          primary_select.classList.add 'hide'
          secondary_select.classList.add 'hide'
          sight_select.classList.add 'hide'
          grip_select.classList.add 'hide'
          attachment_select.classList.remove 'hide'
          utility_select.classList.add 'hide'
        when 'Utility'
          parent_select.classList.add 'hide'
          primary_select.classList.add 'hide'
          secondary_select.classList.add 'hide'
          sight_select.classList.add 'hide'
          grip_select.classList.add 'hide'
          attachment_select.classList.add 'hide'
          utility_select.classList.remove 'hide'

