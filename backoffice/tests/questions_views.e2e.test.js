const when = '[Questions] When a logged user is in /paths/id/tests/id/questions area'
describe('Tests', function() {

    t(when+' if the users is on "/admin/paths/id/tests/id/questions" and wants to go to the questions page then he should click on the button that goes to the questions lists for that test.', function(browser) {
        browser
        .click('a[href="/admin/paths/2/tests/20/questions"]')
        .assert.urlEquals('http://localhost:3001/admin/paths/2/tests/20/questions');
    });

    it(when+' if the user is in /admin/paths/id/tests/id/questions and clicks in "Add question" button, it should redirect to "/admin/paths/id/tests/id/questions/new" page', function(browser) {
        browser
            .assert.urlEquals('http://localhost:3001/admin/paths/2/tests/20/questions')
            .click('.float-right')
            .assert.urlEquals('http://localhost:3001/paths/2/tests/20/questions/new')
            .pause(1000)
    });

    it(when+' if the user is at "/paths/2/tests/20/questions/new" URL and wants to add a question to the test with id "20"', function(browser) {
        browser
            .assert.urlEquals('http://localhost:3001/paths/2/tests/20/questions/new')

            .waitForElementPresent('.mb-4 > form #formText')

            .setValue('.mb-4 > form #formText', 'Java question Title')
            .setValue('.input-group > .form-control #formText', 'Java question answer 1')
            .setValue('.input-group:nth-child(1) > .input-group-apend', 1)
            .setValue('.input-group:nth-child(2) > .input-group-apend', 0)

            .setValue('.input-group:nth-child(2) > .form-control #formText', 'Java question answer 2')
            .setValue('.input-group:nth-child(2) .input-group:nth-child(1) > .input-group-apend', 1)
            .setValue('.input-group:nth-child(2) .input-group:nth-child(2) > .input-group-apend', 1)

            .click('.card-body .btn-save')
            .waitForElementPresent('.table-responsive', 1000)
            .assert.urlEquals('http://localhost:3001/paths/2/tests/20/questions')
            .pause(2000)
    });
 
    it(when+' if the user has created a new question from a test and wants to edit it then he must go to "/paths/id/tests/id/question/id" URL and edit a field from the form then he should be redirected to "/paths/id/tests/id/questions" with the edited data', function(browser) {
        browser
            .click('tr:nth-child(5) a > .btn')
            .waitForElementPresent('.mb-4 > form #formText')

            .setValue('.mb-4 > form #formText', 'Java question Title edited')
            .setValue('.input-group > .form-control #formText', 'Java question answer 1  edited')
            .setValue('.input-group:nth-child(1) > .input-group-apend', 0)
            .setValue('.input-group:nth-child(2) > .input-group-apend', 1)

            .setValue('.input-group:nth-child(2) > .form-control #formText', 'Java question answer 2  edited')
            .setValue('.input-group:nth-child(2) .input-group:nth-child(1) > .input-group-apend', 0)
            .setValue('.input-group:nth-child(2) .input-group:nth-child(2) > .input-group-apend', 1)
            
            .click('.card-body .btn-save')
            .click('a[href="/admin/paths/2/tests/20/questions"]')
            .pause(1000)

            .assert.urlEquals('http://localhost:3001/paths/2/tests/20/questions')
    });
 
    it(when+' if the user wants to delete a question from a path and clicks the delete button then it should be deleted', function(browser) {
        browser
            .url('http://localhost:3001/paths/2/tests/20/questions')
            .waitForElementPresent('.table-responsive')

            .click(`tr:nth-child(5) .btn-group > .btn > .bi`)
            .assert.urlEquals('http://localhost:3001/paths/2/tests/20/questions')
    });
});