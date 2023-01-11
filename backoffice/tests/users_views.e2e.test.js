const when = '[Users] When a logged admin is in /admin/users area'
describe('Users', function() {

    it(when+' if the user clicks in "Add user" button, it should redirect to "/admin/users/new" page', function(browser) {
        browser
            .url('http://localhost:3001/admin/users')
            .useXpath()
            .waitForElementPresent('//div[@id=`app`]/div/div/div/section/div/div/div[2]/div[2]/div')
            .click('#app .content a[href="/admin/users/new"]')
            .assert.urlEquals('http://localhost:3001/admin/users/new')
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
                .url('http://localhost:3001/admin/users/new')
                .waitForElementPresent('//div[@id=`app`]/div/div/div/section/div/div/div[2]')
                .setValue(data.selector, data.value)
                .assert.urlEquals('http://localhost:3001/admin/users/new')
        });
    });
 
    it(when+' if the user is at "/admin/user/new" URL and complete the form, he should be redirected to "/admin/users"', function(browser) {
        browser
            .url('http://localhost:3001/admin/users/new')
            .waitForElementPresent('//div[@id=`app`]/div/div/div/section/div/div/div[2]')
            .setValue('#floatingName',     'Francisco')
            .setValue('#floatingSurname',  'Garcia')
            .setValue('#floatingNickname', 'Frangalo')
            .setValue('#floatingLang',     'es')
            .setValue('#floatingEmail',    'frangalo34@gmail.com')
            .setValue('#floatingPassword', '1234567.A')
            .click('//button[@type=`submit`])[2]')
            .assert.urlEquals('http://localhost:3001/admin/users')
    });

    it(when+' if the user has created a new user and wants to edit its data', function(browser) {
        /* const rows = browser.elements("css selector", "table tr td a.link-secondary").length; */
        browser
            .url('http://localhost:3001/admin/users')
            .waitForElementPresent('//div[@id=`app`]/div/div/div/section/div/div/div[2]/div[2]/div')
            /* var index = [...document.querySelectorAll("table tr td a.link-secondary")].pop() */
            .waitForElementPresent(`//tr[7]/td/a/span`)
            .click((`//tr[7]/td/a/span`))
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
            .pause(1000)
            .assert.urlEquals('http://localhost:3001/admin/users')
    });

    it(when+' if the user wants to delete a user, the page should delete it', function(browser) {
        browser
            .url('http://localhost:3001/admin/users')
            .waitForElementPresent('//div[2]/div[2]/div')
            .useXpath()
            .click('//tr[7]/td[4]/span/button/i')
            .pause(1000)
            .acceptAlert()
            .assert.urlEquals('http://localhost:3001/admin/users')
            .useXpath()
            .pause(1000)
            .click('//span[contains(.,"Paths")]')
    });
});