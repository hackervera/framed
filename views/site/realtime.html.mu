{{{now}}}
<div id='uptime'>Loading data...</div>
<script type='text/coffeescript'>
now.ready = ->
    now.uptime()
now.rUptime = (time, cpus)->
    $('#uptime').html "Server has been online #{time} seconds<br><br>CPU info:<br><br>#{cpus}"
</script>