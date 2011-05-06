{{{now}}}
<div id='uptime'></div>
<script type='text/coffeescript'>
now.ready = ->
    now.uptime()
now.rUptime = (time)->
    $('#uptime').html "Server has been online #{time} seconds"
</script>