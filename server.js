var express = require('express'),
    app = express();

app.use(express.static('public'));

app.get('/', function (req, res) {
    res.sendFile('index.html');
});

app.get('/tracks', function (req, res) {
    res.send({
        tracks: [
            { id: 1, name: 'Track One' },
            { id: 2, name: 'Track Two' },
            { id: 1, name: 'Track Three' }
        ]
    });
});

app.listen(9000);
