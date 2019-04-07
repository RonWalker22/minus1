# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
document.addEventListener 'turbolinks:load', -> 
  body = document.querySelector('body')
  if(body.className == "static_pages docs")
    config = {
      theme: 'neutral'
    }
    mermaid.initialize(config)