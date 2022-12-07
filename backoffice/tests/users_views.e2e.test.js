const when = '[Users] When a logged user is in /users area'
describe('Users', function() {

    it(when+' if the user clicks in "Add user" button, it should redirect to "/users/new" page', function(browser) {
        browser
            .url('http://localhost:3001/users')
            .waitForElementPresent('.table-responsive')
            .click('#app .content a[href="/users/new"]')
            .assert.urlEquals('http://localhost:3001/users/new')
    });
    
    [
        {selector: '#floatingName',         value: 'Francisco',             testVariation: 'and writes the Name but not the other fields'},
        {selector: '#floatingSurname',      value: 'Garcia',                testVariation: 'and writes the Surname but not the other fields'},
        {selector: '#floatingNickname',     value: 'Frangalo',              testVariation: 'and writes the Nickname but not the other fields'},
        {selector: '#floatingLang',         value: 'es',                    testVariation: 'and selects the language but not the other fields'},
        {selector: '#floatingEmail',        value: 'frangalo34@gmail.com',  testVariation: 'and writes the e-mail but not the other fields'},
        {selector: '#floatingPassword',     value: '1234567.A',             testVariation: 'and writes the password but not the other fields'},
    ].forEach((data) => {
        it(when+' if the user is at "/user/new" URL '+data.testVariation+' then the user must complete all the fields to create a new user', function(browser) {
            browser
                .url('http://localhost:3001/users/new')
                .waitForElementPresent('.card')
                .setValue(data.selector, data.value)
                .assert.urlEquals('http://localhost:3001/users/new')
        });
    });
 
    it(when+' if the user is at "/user/new" URL and complete the form, he should be redirected to "/users"', function(browser) {
        browser
            .url('http://localhost:3001/users/new')
            .waitForElementPresent('.card')
            .setValue('#floatingName',     'Francisco')
            .setValue('#floatingSurname',  'Garcia')
            .setValue('#floatingNickname', 'Frangalo')
            .setValue('#floatingLang',     'es')
            .setValue('#floatingEmail',    'frangalo34@gmail.com')
            .setValue('#floatingPassword', '1234567.A')
            .click('.btn-save')
            .assert.urlEquals('http://localhost:3001/users')
    });

    it(when+' if the user has created a new user and wants to edit its data', function(browser) {
        /* const rows = browser.elements("css selector", "table tr td a.link-secondary").length; */
        browser
            .url('http://localhost:3001/users')
            .waitForElementPresent('.table-responsive')
            /* var index = [...document.querySelectorAll("table tr td a.link-secondary")].pop() */
            .waitForElementPresent(`tr:nth-child(6) .link-secondary > span`)
            .click((`tr:nth-child(6) .link-secondary > span`))
            .clearValue('#floatingName')
            .setValue(  '#floatingName',     'Fran')
            .clearValue('#floatingSurname')
            .setValue(  '#floatingSurname',  'Lopez')
            .clearValue('#floatingNickname')
            .setValue(  '#floatingNickname', 'newFrangalo')
            .setValue(  '#floatingLang',     'en')
            .clearValue('#floatingEmail')
            .setValue(  '#floatingEmail',    'francopper2@gmail.com')
            .clearValue('#floatingPassword')
            .setValue(  '#floatingPassword', '7654321.B')
            .click('.btn-save')
            .assert.urlEquals('http://localhost:3001/users')
    });

    it(when+' if the user wants to delete a user, the page should delete it', function(browser) {
        browser
            .url('http://localhost:3001/users')
            .waitForElementPresent('.table-responsive')
            .useXpath()
            .click('//tr[6]/td[4]/span/button/i')
            .pause(1000)
            .acceptAlert()
            .assert.urlEquals('http://localhost:3001/users')
            .useXpath()
            .click('//span[contains(.,"Paths")]')
    });
});