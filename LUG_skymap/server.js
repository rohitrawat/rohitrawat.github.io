var express = require('express');
var app = express();

app.use(express.static(__dirname + '/'));
app.listen(8080);

var exec = require('child_process').exec;

app.get('/getImage', function(req, res){
    var cmd = "sh run.sh " + req.query.lat + " " + req.query.lon;
    console.log(cmd);

    exec(cmd, function(error, stdout, stderr) {
        res.sendFile('skyshot000.png', { root: __dirname })
    });
});
