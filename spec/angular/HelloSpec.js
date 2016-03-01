describe('Hello World', function(){
    var Hello = require('../../app/components/hello/hello');

    it('is true', function(){
        expect(true).not.toBe(true);
    });

    it('says hello', function(){
        expect(Hello.hello()).toEqual('hello');
    });
});