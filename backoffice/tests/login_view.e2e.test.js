const when = '[Login] When a user is not logged in'
describe('Login', function() {

    [
        {user: 'admin',        pass: 'another_password', testVariation: 'valid user but a wrong password'},
        {user: 'another_user', pass: 'admin',            testVariation: 'valid password but a wrong user'},
        {user: 'another_user', pass: 'another_password', testVariation: 'wrong user and password'},
    ].forEach((data) => {
        it(when+' if the user writes a '+data.testVariation+' then it should display an error message saing "user and password does not match"', function(browser) {
        browser
            .url('http://localhost:3001/login')
            .setValue('#app .card-body .form-floating #floatingInput', data.user)
            .sendKeys('#app .card-body .form-floating #floatingPassword', data.pass)
            .click('#app .card-body .btn .btn-primary .btn-login')
            .waitForElementPresent('.alert')
            .click('.btn-close')
            .waitForElementNotPresent('.alert')
            .assert.urlEquals('http://localhost:3001/login')
            
        });
    });

    [
        {url: '/admin/paths'},
    ].forEach((data) => {
        it(when+' if the user tryes to access a protected URL then it will be redirected to /login', function(browser) {
            browser
                .url('http://localhost:3001'+data.url)
                .waitForElementPresent('#app')
                .assert.urlEquals('http://localhost:3001/login')
        });
    });

   it(when+' if the user tryes to access a in valid URL then it will be redirected to "404 page not found"', function(browser) {
            browser
                .url('http://localhost:3001/tests')
                .waitForElementPresent('#app')
    });
   
    it(when+' if the user writes a correct combiation of valid user and password then it should be redirected to /users', function(browser) {
        browser
        .url('http://localhost:3001/login')
        .setValue('#app .content .mb-3:nth-child(1) > .form-control', 'admin')
        .sendKeys('#app .content .mb-3:nth-child(2) > .form-control', 'admin')
        .click('#app .content button[type=submit]')
        .assert.urlEquals('http://localhost:3001/admin/users')
    });
});