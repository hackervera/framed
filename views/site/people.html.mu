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
<button onClick='$.post("/site/people",{name: $("#name").val(), age: $("#age").val()}, function(){ window.location.reload()})'>Add</button>