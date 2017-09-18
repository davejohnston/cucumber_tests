Given(/^I have deployed DIG with service "([^"]*)"$/) do |service|
    url=`minikube service --https #{service} --url | tail -1`.strip
    puts "URL:   [#{url}]"
    Capybara.app_host = url
end

Given(/^I add SSH credentials for user "([^"]*)" with key "([^"]*)"$/) do |username, ssh_key|
    visit 'credential'

    # Fill in the credential name and username
    fill_in_xpath '//*[@id="root"]/div/div[2]/div/div/div[2]/form/div[1]/div/input', with: 'My SSH Cred'
    fill_in_xpath '//*[@id="root"]/div/div[2]/div/div/div[2]/form/div[3]/div[1]/div/input', with: username
    
    # Load SSH Key from file and fill in form
    file = File.open(ssh_key, "rb")
    private_key_contents = file.read
    fill_in_xpath '//*[@id="root"]/div/div[2]/div/div/div[2]/form/div[3]/div[3]/textarea', with: private_key_contents

    click_button 'Add'
end

Given(/^I am on the DIG connect page$/) do 
   visit 'connect'
end

When(/^I will start a forage for "([^"]*)"$/) do |host_list|
    fill_in_xpath '//*[@id="root"]/div/div[2]/div/div/div/form/div[1]/textarea', with: host_list
    click_button 'Continue'
end

Then(/^I should see status change to "([^"]*)"$/) do |status|
    page.all('#root > div > div.App-content > div > div > div.ui.fluid.container.tableContainer > div > div.Table-container > table tbody tr').each do |tr|
        forage_status = tr.all('td')[0]
        expect(forage_status).to have_content status
    
    end
end

Then(/^I should be able to view the forage data$/) do
    visit 'nodes'
    find_link(:text => /(^ubuntu1).*/).visible?
    find_link(:text => /(^centos1).*/).visible?
end
