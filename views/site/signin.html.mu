<script src='https://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js'></script>
<script src='https://github.com/carhartl/jquery-cookie/raw/master/jquery.cookie.js'></script>
<script src='http://jashkenas.github.com/coffee-script/extras/coffee-script.js'></script>
This view is testing cookies on the client and server side as well as embedded coffeescript on the client side
<div id='bind'>{{#name}}Your name is {{name}}{{/name}}</div>

<script type='text/coffeescript' src='/js/signin.coffee'>
