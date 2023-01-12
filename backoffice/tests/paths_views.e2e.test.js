const when = '[Paths] When a logged user is in /admin/paths area'
describe('Paths', function() {

    it(when+' if the users is on "/admin/users" and wants to go to the paths page then he should click on the sidebar paths button.', function(browser) {
        browser
        .click('a[href="/admin/paths"]')
        .assert.urlEquals('http://localhost:3001/admin/paths');
    });

    it(when+' if the user clicks in "Add path" button then it should redirect to "/admin/paths/new" page', function(browser) {
        browser
            .assert.urlEquals('http://localhost:3001/admin/paths')
            .click('.float-right')
            .assert.urlEquals('http://localhost:3001/admin/paths/new')
    });

    it(when+' if the user is at "/admin/paths/new" URL and wants to add a path', function(browser) {
        browser
            .url('http://localhost:3001/admin/paths/new')
            .waitForElementPresent('.formName #formText')
            .setValue('.formName #lang',    'es')
            .setValue('.formName #formText', 'Java')
            .setValue('.formDesc #lang',    'es')
            .setValue('.formDesc #formText', 'Aprende los conceptos de Java')
            .click('.card-body .btn-save')
            .assert.urlEquals('http://localhost:3001/admin/paths')
    });
 
    it(when+' if the user has created a new path and wants to edit it then he must go to "/admin/paths/id" URL and edit a field from the form, then should be redirected to "/admin/paths" with the edited data', function(browser) {
        browser
            .click('tr:nth-child(5) a.link-secondary > span')
            .waitForElementPresent('.formName #lang')

            .setValue('.formName #lang', 'Java edited')
            .setValue('.formDesc #formText', 'Aprende los conceptos de Java edited')
            
            .click('.card-body .btn-save')
            .pause(1000)
            .acceptAlert()
            .click('.card-body .btn-cancel')
            .assert.urlEquals('http://localhost:3001/admin/paths')
    });

    it(when+' if the user is in "/admin/paths" and wants to know the tests that are in one path then he should be redirected to "/admin/paths/id/tests" and if there are not tests, a message "there is no data here" must be displayed', function(browser) {
        browser
            .url('http://localhost:3001/admin/paths')
            .waitForElementPresent('.table-responsive')
            
            .click(('tr:nth-child(2) .styledLink > .btn'))
            .waitForElementPresent('.table-responsive', 1000)

            .click('a[href="/admin/paths"]')
            .assert.urlEquals('http://localhost:3001/admin/paths')
            
            .click(('tr:nth-child(3) .styledLink > .btn'))
            .waitForElementPresent('h1')
            .getText('h1', function () {
                browser.expect.element('h1').text.to.equal("There is no data here");
            })
            .click('a[href="/admin/paths"]')
            .assert.urlEquals('http://localhost:3001/admin/paths')

    });

    it(when+' if the user wants to delete a path, the page should delete it', function(browser) {
        browser
            .url('http://localhost:3001/admin/paths')
            .waitForElementPresent('.table-responsive')
            .click((`tr:nth-child(5) .btn-group > .btn > .bi`))
            .acceptAlert()
            .assert.urlEquals('http://localhost:3001/admin/paths')
            .click('tr:nth-child(2) .styledLink > .btn')
    });
});