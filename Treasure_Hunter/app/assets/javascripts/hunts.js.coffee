# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


$ ->



  # Displaying the hunt information
  $('.huntView').on 'click', '.huntNav', ->
    # Grab the current tab to use in the callback function
    currentTab = $(this)

    # Grab the id of the hunt for the ajax call
    id = $(this).parent().data('id')

    # Make the ajax call to get the hunt information
    call = $.ajax("/hunts/#{id}", {
        method: 'GET'
      })

    # Display the hunt information after the ajax call is successful
    call.done (data) ->
      # Clear out any information that the hunt display is showing, so the new info can be shown
      $('.huntDisplay').empty()
      console.log data
      # Displaying the correct information based on which tab is currently active
      if currentTab.hasClass('huntDetails')
        $('.huntDisplay').prepend("<ul class='details'>
            <li><h5>Hunt Title:  </h5><p>#{data.title}</p></li>
            <li><h5>Hunt Description:  </h5><p>#{data.description}</p></li>
            <li><h5>Hunt Prize:  </h5><p>#{data.prize}</p></li>
            <li><h5>Start on:  </h5><p>blah</p></li>
            <li><h5>Start Location:  </h5><p>blah</p></li>
            <li><h5>Number of Clues:  </h5><p>blah</p></li>
            <li><h5>Participants:  </h5><p>blah</p></li>
          </ul>")
      else if currentTab.hasClass('huntClues')
        $('.huntDisplay').prepend("<h4>Clue 5 of 10</h4><br>
          <p>My money's in that office, right? If she start giving me some bullshit about it ain't there, and we got to go someplace else and get it, I'm gonna shoot you in the head then and there. Then I'm gonna shoot that bitch in the kneecaps, find out where my goddamn money is. She gonna tell me too. Hey, look at me when I'm talking to you, motherfucker.</p><br>
          <h3 class='completed' data-info='#{data.title}'>Completed Clues</h3>")
        $('.completed').click ->
          alert 'hi'

      else if currentTab.hasClass('huntMap')
        $('.huntDisplay').prepend("<div class='map'>Map</div>")
      else
        $('.huntDisplay').prepend("<ul class='leaders'>
          <li><h5>Jennie</h5><p>5</p></li>
          <li><h5>Nico</h5><p>3</p></li>
          <li><h5>James</h5><p>3</p></li>
          <li><h5>Leon</h5><p>1</p></li>
          </ul>")

  $('.completed').click ->
    alert 'hi'







