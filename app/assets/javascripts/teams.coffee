# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
document.addEventListener 'turbolinks:load', ->
  body = document.querySelector('body') 
  if body.className == "teams index" || body.className == "teams show"
    modal = document.querySelector '.modal'
    close_modal_btn = document.querySelector '.close-btn'
    modal_background = document.querySelector '.modal-background'
    modal_title = document.querySelector '.modal-card-title'

    modal_background.addEventListener 'click', ->
      modal.classList.remove 'is-active'
    close_modal_btn.addEventListener 'click', ->
      modal.classList.remove 'is-active'

  if(body.className == "teams index")
    new_team_btn = document.querySelector '.new-team-btn'
    import_btn = document.querySelector '.import-btn'
    team_form = document.querySelector '.team-form'
    team_import_form = document.querySelector '.team-import-form'

    new_team_btn.addEventListener 'click', ->
      modal.classList.add 'is-active'
      modal_title.innerHTML = 'New Team'
      team_form.classList.remove 'hide'
      team_import_form.classList.add 'hide'
    import_btn.addEventListener 'click', ->
      team_form.classList.add 'hide'
      modal.classList.add 'is-active'
      team_import_form.classList.remove 'hide'
      modal_title.innerHTML = 'Select a Team to Import'
  else if(body.className == "teams show")
    join_team_btn = document.querySelector '.join-team-btn'
    rank_manager_btn = document.querySelector '.rank_manager_btn'
    change_title_form = document.querySelector '.change-title-form'
    join_team_form  = document.querySelector '.join-team-form'
    
    rank_manager_btn.addEventListener 'click', ->
      modal.classList.add 'is-active'
      change_title_form.classList.remove 'hide'
      join_team_form.classList.add 'hide'
    if join_team_btn
      join_team_btn.addEventListener 'click', ->
        modal.classList.add 'is-active'
        join_team_form.classList.remove 'hide'
        change_title_form.classList.add 'hide'