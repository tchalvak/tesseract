var page = require('webpage').create(),
      system = require('system'),
        t, address;
url = system.args[1];
page.open(url, function(status) {
  var title = page.evaluate(function() {
    return document.title;
  });
  console.log('Page title is ' + title);
  phantom.exit();
});
