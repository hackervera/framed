This is an example of using mustache templating and <a href='http://www.mongoosejs.com'>mongoose</a> based model
{{#docs}}
<p>
{{#doc}}
    Name: {{name}}
    Age: {{age}}
    {{#rank}}Rank: {{rank}}{{/rank}}
{{/doc}}
</p>
{{/docs}}
<br>
Add person:<br>
name <input type='text' id='name'><br>
age<input type='text' id='age'><br>
<button id='button'>Add</button>
<script type='text/coffeescript'>
$('#button').bind 'click', ->
    $.post "/site/people",{name: $("#name").val(), age: $("#age").val()}, (result)->            
        if result.errors?
            alert result.errors.name
        window.location.reload()
</script>