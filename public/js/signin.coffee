$('#bind').bind('click', ->
    $.cookie('name', null)
    window.location.reload()
)
if not $.cookie('name')
    name = prompt 'what is your name?'
    $.cookie('name', name)
    window.location.reload()