const when = '[Tests] When a logged user is in /admin/paths/id/tests area'
describe('Tests', function() {

    it(when+' if the users is on "/admin/users" and wants to go to the paths page then he should click on the sidebar paths button.', function(browser) {
        browser
        .click('a[href="/admin/paths/2/tests"]')
        .assert.urlEquals('http://localhost:3001/admin/paths/2/tests');
    });

    it(when+' if the user clicks in "Add test" button, it should redirect to "/admin/paths/id/tests/new" page', function(browser) {
        browser
            .assert.urlEquals('http://localhost:3001/admin/paths/2/tests')
            .click('.float-right')
            .assert.urlEquals('http://localhost:3001/admin/paths/2/tests/new')
            .pause(1000)
    });

    it(when+' if the user is at "/admin/paths/2/tests/new" URL and wants to add a test to the path with id "2"', function(browser) {
        browser
            .assert.urlEquals('http://localhost:3001/admin/paths/2/tests/new')

            .waitForElementPresent('.form-group:nth-child(1) #formText')

            .setValue('.form-group:nth-child(1) #formText', 'Java Test 2')
            .setValue('.form-group:nth-child(2) #formText', 'Este es el segundo test de Java')

            .click('.card-body .btn-save')
            .waitForElementPresent('.table-responsive', 1000)
            .assert.urlEquals('http://localhost:3001/admin/paths/2/tests')
            .pause(2000)
    });
 
    it(when+' if the user has created a new test from a path and wants to edit it then he must go to "/admin/paths/id/tests/id" URL and edit a field from the form then he should be redirected to "/admin/paths/id/tests" with the edited data', function(browser) {
        browser
            .click('tr:nth-child(4) .link-secondary')
            .waitForElementPresent('.form-group:nth-child(1) #formText')

            .setValue('.form-group:nth-child(1) #formText', 'Java Test 2 edited')
            .setValue('.form-group:nth-child(2) #formText', 'Este es el segundo test de Java edited')
            
            .click('.card-body .btn-save')
            .pause(1000)
            .click('a[href="/admin/paths/2/tests"]')


            .assert.urlEquals('http://localhost:3001/admin/paths/2/tests')
    });

    it(when+' if the user is in "/admin/paths/id/tests" and wants to know the questions that are in one test then he should be redirected to "/admin/paths/id/tests/id/questions" and if there are not tests, a message "there is no data here" must be displayed', function(browser) {
        browser
            .assert.urlEquals('http://localhost:3001/admin/paths/2/tests')
            .click('tr:nth-child(3) a > .btn')
            .waitForElementPresent('.card-body .table-responsive')
            
            .click('a[href="/admin/paths/2/tests"]')
            .waitForElementPresent('.table-responsive', 1000)

            .click('tr:nth-child(4) a .bi')
            .assert.urlEquals('http://localhost:3001/admin/paths/2/tests/66/questions')
            
            .waitForElementPresent('h1')
            .getText('h1', function () {
                browser.expect.element('h1').text.to.equal("There is no data here");
            })
            .click('a[href="/admin/paths/2/tests"]')
            .assert.urlEquals('http://localhost:3001/admin/paths/2/tests')

    });

    it(when+' if the user wants to delete a test from a path then it should be deleted', function(browser) {
        browser
            .url('http://localhost:3001/admin/paths/2/tests')
            .waitForElementPresent('.table-responsive')

            .click(`tr:nth-child(4) .btn-group > .btn > .bi`)
            .acceptAlert()
            .assert.urlEquals('http://localhost:3001/admin/paths/40/tests')
    });
});