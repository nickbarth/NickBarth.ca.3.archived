var express = require('express'),
    app = express(),
    port = process.env.PORT || 3000;

app.configure(function(){
  app.use('/assets', express.static(__dirname + '/assets'));
  app.use('/', express.static(__dirname + '/public'));
});

app.set('view engine', 'ejs');
app.set('view options', { layout: false });
app.set('views', __dirname + '/public/views');

app.get('/', function (req, res) {
  res.render('index', { pageHtml: page.text });
});

app.listen(port);