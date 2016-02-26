var page = require('webpage').create();
page.open('http://tesseract.local', function(status) {
  console.log("Status: " + status);
  if(status === "success") {
    page.render('tesseract.local.png');
  }
  phantom.exit();
});
