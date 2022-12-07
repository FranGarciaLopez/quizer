const when = '[Paths] When a logged user is in /paths area'
describe('Paths', function() {

    it(when+' if the user clicks in "Add path" button then it should redirect to "/paths/new" page', function(browser) {
        browser
            .assert.urlEquals('http://localhost:3001/paths')
            .useXpath()
            .click('//a[contains(text(),"Add Path")]')
            .assert.urlEquals('http://localhost:3001/paths/new')
    });

    it(when+' if the user is at "/paths/new" URL and wants to add a path', function(browser) {
        browser
            .url('http://localhost:3001/paths/new')
            .waitForElementPresent('(//input[@id="formText"])[1]')
            .setValue('(//select[@id="lang"])[1]',    'es')
            .setValue('(//input[@id="formText"])[1]', 'Java')
            .setValue('(//select[@id="lang"])[2]',    'es')
            .setValue('(//input[@id="formText"])[2]', 'Aprende los conceptos de Java')
            .click('(//button[@type="submit"])[2]')
            .assert.urlEquals('http://localhost:3001/paths')
    });
 
    it(when+' if the user has created a new path and wants to edit it then he must go to "/paths/id" URL and edit a field from the form, then should be redirected to "/paths" with the edited data', function(browser) {
        browser
            .click('//tr[4]/td/a/span')
            .waitForElementPresent('(//input[@id="formText"])[1]')

            .setValue('(//input[@id="formText"])[1]', 'Java edited')
            .setValue('(//input[@id="formText"])[2]', 'Aprende los conceptos de Java edited')
            
            .click('(//button[@type="submit"])[2]')
            .pause(1000)
            .acceptAlert()
            .click('//button[@type="submit"]')
            .assert.urlEquals('http://localhost:3001/paths')
    });

    it(when+' if the user is in "/paths" and wants to know the tests that are in one path then he should be redirected to "/paths/id/tests" and if there are not tests, a message "there is no data here" must be displayed', function(browser) {
        browser
            .url('http://localhost:3001/paths')
            .waitForElementPresent('//div[2]/div[2]/div')
            
            .click(('//tr[2]/td[5]/span/div/a/button/i'))
            .waitForElementPresent('//div[2]/div[2]/div', 1000)

            .click('//a[contains(text(),"Paths")]')
            .assert.urlEquals('http://localhost:3001/paths')
            
            .click(('//tr[3]/td[5]/span/div/a/button/i'))
            .waitForElementPresent('//h1')
            .getText('//h1', function () {
                browser.expect.element('//h1').text.to.equal("There is no data here");
            })
            .click('//a[contains(text(),"Paths")]')
            .assert.urlEquals('http://localhost:3001/paths')

    });

    it(when+' if the user wants to delete a path, the page should delete it', function(browser) {
        browser
            .url('http://localhost:3001/paths')
            .waitForElementPresent('//div[2]/div[2]/div')
            .useXpath()
            .click((`//tr[5]/td[5]/span/div/button/i`))
            .acceptAlert()
            .assert.urlEquals('http://localhost:3001/paths')
            .click('//tr[4]/td[5]/span/div/a/button/i')
    });
});