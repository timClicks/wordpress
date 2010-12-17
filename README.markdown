# Wordpress on Engine Yard AppCloud

Have you wanted to get Wordpress installed on Engine Yard AppCloud?  Well we have something in common then!

## Installation Procedure

### Step 1. Fork this Repository

Of course you'll need a github account, but then if you're here you probably have one.

You need to fork your own Git Repository URI so that you can add a Deploy Key in a few steps.

### Step 2. Add the Application to Your EY AppCloud Account

  1. Click on **Applications** under Server Tools on the left.
  2. Then look for the **Add a New Application** button in the top right.  Click on that.
  3. Give the Application Name of "**wordpress**".
  4. Copy and paste your **Git Repository URI**, you just forked in Step 1.
  5. Change the Application Type to **Rack**.
  6. The **latest version** of Rack is fine, it's ultimately irrelevant.
  7. Click the **Create application** button to save your app.

### Step 3. Add Your Git Deploy Key to Your Repository's Deploy Key

  1. On your repository's page click on the **Admin** button.
  2. Then click on **Deploy Keys** under the left hand side.
  3. Click on **Add another deploy key**.
  4. Give it a Title like "**EY AppCloud**".
  5. Then paste in the **Key**, and click on the **Add key** button.
  6. Then switch back to EY AppCloud and click on the **My Deploy Key is in Place** button.
  7. There are no extra Gems to setup, click the **Next Step** button to proceed to Step 4.

### Step 4. Configure Unix Packages

  1. Enter "**dev-lang/php**" in the search.
  2. Click the **Add ->** button to add PHP to the wordpress application.
  3. Enter "**lighttpd**" in the search.
  4. Click on **Add ->** button so we get the fcgi processes from the lighttpd package.
  5. Now we're done configuring the Unix Packages so click on **Go to dashboard**.

### Step 5. Create a New Environment

  1. From the Dashboard, click on the **Create New Environment** button.
  2. Give your Environment a name, I choose "**blog**".
  3. The rest of the default options are fine, click "**Create environment**" to save the settings.
  4. You then need to choose which Application to add to your Environment.  Choose the **wordpress** application we configured in Steps 2 - 4, by clicking on the "**Add to blog**" button.
  5. The **Choose a Domain Name** dialog appears.  Just click **Save domain name** to proceed.

### Step 6. Boot Your Environment

  1. Click on the **Boot Instances** button for your Environment.
  2. The default instance size is a High CPU Medium.  If this is more than you need, you can click on **Custom** and choose **Small** from the *Server size* drop-down list.
  3. In order to setup your DNS later, you'll need to use an IP address.  So make sure to choose **Add IP Address** from the *External Address* drop-down.
  4. Click **Boot This Configuration** to start the instance.

### Step 7. Meanwhile Back at the CLI

While that environment boots, let's get some other things setup.

In order to complete the installation, you'll need to install the `engineyard` rubygem.

`sudo gem install engineyard`

You also need to have your repository checked out to your local machine, so we can run a couple of commands to upload and run custom chef recipes on your environment.

  1. Open your code directory.

`cd ~/code`

  2. Run the git command to clone the repository locally.  **USE YOUR REPO**

`git clone git@github.com:<username>/wordpress.git`

  3. From that new folder, let's upload the custom chef recipes.

`cd ~/code/wordpress`

`ey recipes upload`

  4. This will prompt you for your username and password (unless you've used this before).  Enter the same user/pass you use to login to Engine Yard AppCloud.

### Step 8. Deploy the Application

  1. While we are here in the CLI, we can deploy the application.

`ey deploy --no-migrate`

  2. Then we'll run the custom chef recipes to finish it off.

`ey recipes apply`

### Step 9. Open Your Wordpress Blog

  1. Go to your Engine Yard AppCloud Dashboard, then click on the **HTTP** link.
  2. You can start to setup your Wordpress blog.  Enjoy!

## Explanation of Non-Wordpress Files

    README.markdown  |  You're reading it sonny-jim.
    Rakefile         |  Tasks to create a cookbook or test for syntax errors.
    cookbooks/       |  The custom chef recipes folder.
    deploy/          |  This folder allows for EY AppCloud deploy hooks.

Read the code in the files for more information.  The rest of the files are needed to run wordpress.
