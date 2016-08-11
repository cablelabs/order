var async   = require('async'),
    fs      = require('fs'),
    jsonfile = require('jsonfile'),
    path  = require('path');

var map = {};

async.parallel({
    template: getSwaggerTemplate,
    paths: getPaths,
    definitions: getDefinitions
}, function(err, result) {
    if (err) {
        callback(err);
    } else {

        //console.log(result.paths);

        result.template.paths = result.paths;
        result.template.definitions = result.definitions;

        var resultString = JSON.stringify(result.template, null, 4);

        async.forEach(Object.keys(map), function (item, cb) {
            var replacement = map[item];
            console.log("Item : " + item + " replace : " + replacement);
            resultString = resultString.replace(new RegExp(item, 'g'), replacement);
        });

        console.log(resultString);

        fs.writeFile(path.join(__dirname + '/../swagger-file.json'), resultString, function(err) {
            console.log("Done!!");
        });
    }
});

// Get Swagger template
function getSwaggerTemplate(callback) {
    var data = jsonfile.readFileSync(path.join(__dirname + '/swagger-template.json'));
    callback(null, data);
}

// Get all the path definitions
function getPaths(callback) {
    var returnJson = {};
    fs.readdir(path.join(__dirname + '/../endpoints/'), function(err, files) {
        async.forEach(files, function(item, index) {
            if(item.indexOf(".json") > 0) {
                var data = jsonfile.readFileSync(path.join(__dirname + '/../endpoints/' + item));
                async.filter(Object.keys(data), function (path, cb) {
                    returnJson[path] = data[path];
                });
            }
        });
        callback(null, returnJson);
    });
}

// Get all the endpoints definitions
function getDefinitions(callback) {

    var returnJson = {};
    fs.readdir(path.join(__dirname + '/../schemas/json-schema/'), function(err, files) {
        async.forEach(files, function(item, index) {
            if(item.indexOf(".json") > 0) {
                var data = jsonfile.readFileSync(path.join(__dirname + '/../schemas/json-schema/' + item));
                map[item + "#"] = "#/definitions/" + data.title;
                returnJson[data.title] = data;
            }
        });
        callback(null, returnJson);
    });
}
