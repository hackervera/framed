This view is testing cookies on the client and server side as well as embedded coffeescript on the client side
<div id='bind'>
<script type='text/coffeescript'>
    $('#bind').bind 'click', ->
        console.log 'clicked'
        $.cookie 'digest', null
        window.location.reload()
</script>
{{#signedin}}
    You are signed in
{{/signedin}}
{{^signedin}}
    <script type='text/coffeescript'>
        name = prompt 'enter "tyler"'
        pass = prompt 'enter "foo"'
        
        $.post '/site/signin', {name: name, password: pass}, (result)->
            if result != 'false'
                $.cookie 'digest', result
                window.location.reload()
            else
                $('#bind').append 'Wrong password'
    </script>
{{/signedin}}
</div>