describe("ClickMessage", function() {
  var Angular = require('../../app/shared/angular.1.3.11');
  var Controller = require('../../app/components/click/ClickMessage');
  var controller;

  beforeEach(function() {
    controller = new Controller();
  });

  it("should be able to modify a button", function() {
    controller.changeMessage();
    expect(controller.message).toEqual('Goodbye');
  });
});
