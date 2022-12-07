const when = '[Questions] When a logged user is in /paths/id/tests/id/questions area'
describe('Tests', function() {

    it(when+' if the user clicks in "Add test" button, it should redirect to "/paths/id/tests/new" page', function(browser) {
        browser
            .assert.urlEquals('http://localhost:3001/paths/40/tests')
            .useXpath()
            .click('//a[contains(text(),"Add test")]')
            .assert.urlEquals('http://localhost:3001/paths/40/tests/new')
            .pause(1000)
    });

    it(when+' if the user is at "/paths/40/tests/new" URL and wants to add a test to the path with id "40"', function(browser) {
        browser
            .assert.urlEquals('http://localhost:3001/paths/40/tests/new')

            .waitForElementPresent('(//input[@id="formText"])[1]')

            .setValue('(//input[@id="formText"])[1]', 'Java Test 2')
            .setValue('(//input[@id="formText"])[2]', 'Este es el segundo test de Java')
            .setValue('(//input[@id="formText"])[3]', 'Necesito ver primero tus conocimientos de Java')

            .click('(//button[@type="submit"])[2]')
            .waitForElementPresent('//div[2]/div[2]/div', 1000)
            .assert.urlEquals('http://localhost:3001/paths/40/tests')
            .pause(2000)
    });
 
    it(when+' if the user has created a new test from a path and wants to edit it then he must go to "/paths/id/tests/id" URL and edit a field from the form then he should be redirected to "/paths/id/tests" with the edited data', function(browser) {
        browser
            .click('//a[contains(text(),"Java Test 2")]')
            .waitForElementPresent('(//input[@id="formText"])[1]')

            .setValue('(//input[@id="formText"])[1]', 'Java Test 2 edited')
            .setValue('(//input[@id="formText"])[2]', 'Este es el segundo test de Java edited')
            .setValue('(//input[@id="formText"])[3]', 'Necesito ver primero tus conocimientos de Java edited')
            
            .click('(//button[@type="submit"])[2]')
            .click('//button[@type="submit"]')
            .pause(1000)

            .assert.urlEquals('http://localhost:3001/paths/40/tests')
    });

    it(when+' if the user is in "/paths/id/tests" and wants to know the questions that are in one test then he should be redirected to "/paths/id/tests/id/questions" and if there are not tests, a message "there is no data here" must be displayed', function(browser) {
        browser
            .assert.urlEquals('http://localhost:3001/paths/40/tests')
            .click('//tr[1]/td[5]/span/div/a/button/i')
            .waitForElementPresent('//div[2]/div[2]/div')
            
            .click(('//a[contains(text(),"Tests")]'))
            .waitForElementPresent('//div[2]/div[2]/div', 1000)

            .click('//tr[3]/td[5]/span/div/a/button/i')
            .assert.urlEquals('http://localhost:3001/paths/40/tests/30/questions')
            
            .waitForElementPresent('//h1')
            .getText('//h1', function () {
                browser.expect.element('//h1').text.to.equal("There is no data here");
            })
            .click('//a[contains(text(),"Tests")]')
            .assert.urlEquals('http://localhost:3001/paths/40/tests')

    });
 
    it(when+' if the user wants to delete a test from a path then it should be deleted', function(browser) {
        browser
            .url('http://localhost:3001/paths/40/tests')
            .waitForElementPresent('//div[2]/div[2]/div')

            .click((`//tr[4]/td[5]/span/div/button/i`))
            .acceptAlert()
            .assert.urlEquals('http://localhost:3001/paths/40/tests')
            .click('//tr[2]/td[5]/span/div/a/button')
    });
});