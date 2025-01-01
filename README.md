# Adventure Works Data Engineering Project using Azure Platform

This project will help you in understanding the Azure Services and how to use them for Data Engineering.

Here, I am using Adventure Works dataset which has 10 different csv files in it. You can find it on https://www.kaggle.com or download it from my github repo.

This project have 3 stages for its completion, I have named it as bronze, silver and gold layer. So, we will transfer data from bronze layer to silver and then gold layer, and this process will actually include the ETL process. After this we will access the final data on Power BI desktop app for analysis part.

# 1. Azure Account
Microsoft Azure provide 3 different types of subscription account that an user can opt for.
- <u>Free subscription account:</u> When creating account, Microsoft provide an option for free account where user get $200 for 30 days where he/she can user their services within that limit and no money will be charged to them.
- <u>Pay as You Go:</u> While creating account, if you choose this option, then you will be charged as per the services you have used for how much time. And the final amount will be reflecting on you account's billing.
- <u>Enterprise Agreement:</u> This account is basically created by organisations where they handle the usage of the services as per the requirement.

As for the beginner, suggested will be the Free Subscription account so that you will have the idea what you have used and how much they charge for the services. Later, you can upgrade the account to Pay as You Go subscription💰.

You don't need any organization mail id or outlook id for registration. You can use your gmail account for registration on Microsoft Azure portal.

<b>Note:</b> While creating account they will ask for credit card 💳 information for verification. You can provide any valid credit card. No amount will be deducted from that until you pay from that, its just for verification purpose.

# 2. Create a Resource Group (RG)
Once you have completed your registration process, you will be navigating to Azure Home page where some services will be listed below that you will see resources you have created or used recently and next to it will be Favourite tab.
- Click on Resource Group service listed on top or if it is not available then you can search it from the search bar.
- Now, you will see you subscription type for your resource group. Next to it, provide the resource group name. Remember, it should be unique within that subscription all over the world.
- Next, select any region as per your convenience and click on Next or directly to <b>Review + Create</b> button. And wait for the validation to be completed.

Once done, click on Home and there you can see your newly created Resource Group.🥳🥳

# 3. Create a Storage Account Resource
After creating a RG, now its time to create storage account where we will be saving our raw, processed & trasformed data.
- So now again click on search bar and search for storage account and click on it.
- Again, we can see the subscription available for the account and the RG selected for you.
- Enter a unique storage account name and the region.
- Next, for <b>Primary Service</b> select <b>Azure Blob Storage or Datalake Gen2</b> option.
- For performance, keep Standard as default.
- Now, for <b>Redundancy</b> you can see options as LRS, GRS, ZRS and GZRS. Select <b>Local Redundancy Storage</b>. This will make your data available locally to you. Click on Next.
- Now, Azure by-default create a blob storage but we require a Datalake Gen2 Storage. So, for that check the <b>Enable hierarchical Namespace</b> checkbox. This will tell Azure to make the storages as Datalake instead of Blob storage.
- Now, directly click on <b>Review + Create</b> button. Once it is validated, storage account will be created.

Now, we have our storage account but still we have to create storages under this account where our data will be saved. So for that, click on Home button and under Recent tab you can see 2 resources which you have accessed.
- Click on your storage account and there you will see Overview of the account.
- On the left hand pane, you will see multiple options. Click on Data Storage. You will options as Container, File Shares, Queues and Tables. Click on <b>Container</b>.
- On top, click on <b>+ Container</b>.
- Enter container name such that later this can be distinguished with each layer of completion. Likewise create two more containers.

Now, we have storage to save raw and other data.

# 3. Create Data Factory Resource and pipeline
Now we have to create a Data Factory. It is a storage system where data is stored in structured manner or transformed data is stored. It also manages the data pipeline and transform it to a meaningful form.

Here, we will use to transform data from raw to structure form and save it to first layer datalake.
- Click on search bar and search for azure data factory and click on it.
- Click on <b>+ Create</b> to create a new Data Factory.
- Again, subscription type will be selected. Select the RG for which we have to link the data factory.
- Enter the data factory name, and the region.
- Now, click on the Data Factory just created. And then click on <b>Launch Studio</b>.

Now, we will proceed with Data Factory pipeline creation.
- Here, on left side pane click on Expand icon and you will see Home, Author, Monitor, Manage, and Learning Center.
- Click on <b>Author</b> and will see Pipelines, Change Data Capture, Datasets, Dataflows, and Power Query. These options will help you to automate the ETL process from source to sink.
- Click on Ellipse icon (᠁ ) on Pipeline option and select <b>New Pipeline</b>. On right side pane, rename the pipeline.
- Now, we have to fetch multiple raw data files from a source and save it to first layer datalake storage. For that, under Activities section search <b>Copy Data</b>, and select it.
- First, we have to decide a source and for me, I have selected Github as a source. So, I have uploaded the raw csv data to my Github account.
- Now, again create a storage just like earlier 3 we have created.
- Go to your Github repo where raw csv is uploaded and click on csv file to open. Click on raw and copy the link and save it in any file.
- Now since we have the source and sink (first layer storage datalake) ready and we have to link source with a connection. So, for that click on <b>Manage</b> option on left side pane.
- Click on <b>Linked Services</b> option and select <b>+ New</b>. You will see list multiple service from with which we can create a connection.
- Search for <b>http</b> connection and click on it. Enter a name to the connection. Under base URL, paste the link which is saved earlier but upto .com rest part is the relative link. Select <b>Anonymous</b> for Authentication type.
- Next, click on <b>Test Connection</b> to check if it is able make connection with the base URL. Once it is successful, click on Save.
- Now, we have to make a connection with sink. For that, click on <b>+ New</b> and search datalake and select and continue.
- Enter service name, next select the subscription and Storage account name under which 4 storages have been created.
- Now test the connection and upon success, click on Save.

So, upto here we are ready with our source, link with the 
source, sink and link with the sink. Now, we have to get data from source which is Github and then save it to the first layer Datalake Storage. 
- Click on Author, there we have a Copy Data activity. Under Source field of that activity, click on <b>New</b>.
- Again we will see same linked services list which earlier we created. Search for <b>http</b> service and click on Continue.
- Enter a distinguished name so that later no confusion should be there with the earlier created one.
- Under <b>Linked Services</b>, you will be seeing the service name which have been created earlier. Since it has base URL, we will be needing it.
- Now, after selecting it, <b>Relative URL</b> field will get appear. Since, we have the relative URL which we copied, but that was for one we require for all the 10 csv files.
- Next, click on <b>Advanced</b> and under that click on <b>Open dataset</b>.
- So, here we can see that base URL is already fetched but relative URL field is blank. Click on it and you will see dynamic content, click on it.
- Now, at lower half you can see parameter option, click on it. Enter a suitable name as it will take the dynamic relative URL for the csv files.
- Click on Save.
- Now, you can see the parameter you have created, click on it and you can see it on pipeline expression builder. Click OK.

Now, you can see Relative URL field has a dynamic variable which will have url for all the csv file. Next, move to the pipeline tab and check under Source tab, you can see the dynamic variable has been mapped. But, for value field there is nothing. So, we have to give the value to that dynamic variable and for that we will be using loop. And how to do that will be taking later.

For now, we will focus on <b>Sink</b> tab.
- Click on <b>Sink</b> and then <b>+ New</b>.
- Now, we have to save our data to Datalake. So, for that we will search Azure Datalake and select it and select format which csv.
- Enter a name distinguish from the earlier which is created. Select the linked service.
- Now, to save the file we require folder name & then file name. So, for that again we will click on <b>Advanced</b> option and then <b>Open dataset</b>.
- Under file path for <b>File System</b> field, enter the name of the container used for first layer storage.
- Now, for <b>Directory</b> we will require a dynamic variable since under that container nothing is created. So, click on <b>Add dynamic content</b>.
- Click on + parameter. Enter a name for easily identifying it. Click on save and then pick that parameter by clicking on it and click OK. Now, you can see the parameter on <b>Directory</b> field.
- Similarly, create it for <b>File name</b> field.

Now, navigate to Copy Activity and under <b>Sink</b> tab, you can see two dynamic variable with no values in it. For the values to move into it, we will use for loop to iterate through the relative paths, folder name and file name. So, for that follow these steps.
- Under <b>Activities</b> pane, search for <b>ForEach</b> and drag it to work area & rename it.
- Under <b>Settings</b>, check <b>Sequential</b> checkbox. This will take the path sequentially and save it.

After this, create a file with JSON format and save it. Now, we have three parameter variable i.e., source relative path, directory and file name. Copy the variables name and then paste it to json file. Against the source relative path paste the rest path of the URL copied from Github repo, then for directory write a folder name such that it can be easily identified and lastly write the file name with which it needs to be saved in Datalake container. For reference check my <b>Azure scripts</b> folder. Similarly, create key value pair for each of the csv file.
- Now, go to the container and click on the storage which was last created other than the 3 layer storage container.
- Upload the json file you just created to the container.

Now again navigate to Azure Data Factory, and on Activities pane search for <b>Lookup</b> option. This option will basically look into the json file and try to fetch the raw data from Github but will not save it to Datalake first layer storage.
- Search for <b>Lookup</b> option and drag it to work page & rename it.
- Navigate to settings tab and click on <b>+</b> for Source dataset field.
- Search Azure Datalake then select & continue.
- Next, this time instead of csv we have to select json as we have uploaded json file in the container. Select json and continue.
- Enter name and select the Linked service from the drop down.
- Now for <b>File Path</b>, click on file browser 📁, this will show you the containers you have created. Select the container in which json file is saved and then select the json file under it.
- Then click on OK.

Now, <b>Lookup</b> is set but before checking it, first uncheck the <b>First row only</b> option. While this is selected <b>Lookup</b> will only run for the first array object not for all. So, always uncheck it until it is not necessary to check.

So, we have to check that if our connection for <b>Lookup</b> is working or not. For that, we need to debug it by only running the <b>Lookup</b> box. So, click on <b>ForEach</b> box and on <b>General</b> select <b>Deactivate</b>. Similarly, do this for Copy Data box and then click on debug button above the workspace. Wait until the process isn't completed.

Once it is completed, you can see the output by hovering over the <b>Lookup output</b> and click on exit icon. You will see the count of object within that array and under value array you can see the data which is being saved as json file.

Now, activate the other two boxes and proceed with the data pipeline creation.
- After activating, connect the <b>Lookup</b> box with <b>ForEach</b> box by hovering hover the <b>Lookup</b> box and dragging the success node to <b>ForEach</b> box.
- Now, we have to add dynamic item to <b>ForEach</b> loop. Click on Item field and select <b>Add dynamic content</b>.
- Now, you will see <b>Activity Output</b> tab has some options select <u>array of row data</u>. This will basically take the output of <b>Lookup</b> and fetch the values array from it.
- Now, select the <b>Copy Data</b> box and carefully cut from the space, don't delete it.
- Next, click on <b>ForEach</b> box, and you will see <u>Activities</u> tab, select it.
- You will see <b>ForEach</b> row with a pencil ✎ icon. Click on it, this will open a new workspace and paste the <b>Copy Data</b> into it.
- Now, on source tab we can add value for relative path variable. Click on the value field and select <b>add dynamic content</b>.
- You can see an item under <b>ForEach Iterator</b>, select it. Then you can see some expression is added to the builder space.
- Now, from whole of the item we just want the relative path url to be the value. So, add (.) and your relative path url key name in the json file. And then click on save.
- Click on <b>Sink</b> and do the same thing for both folder and file name variable value.

Remember that the value name should be same as mentioned in the json file, otherwise it will not fetch the value and throw error. After doing this, hit debug and wait for whole <b>ForEach</b> to get executed.

Once execution is completed, click on <b>Publish</b> button at the top to save all the work. After publishing is completed, go to home and then to the first level container. There you can see some folders for each dataset is fetched and under that csv file is present with name mentioned on the json file.

# 4. Create Azure Databricks Resource
Databricks is a platform to analyze and transform raw data to a meaning insights such that further analysis could be easy and hassle free.

So, at this step we will read data from first layer container and then tranform it using Databricks and then again save it to second layer container.
- Click on Home button and search for Azure Databricks on search bar & click on it and then Create
- Here also you will see your subscription is selected. Select the RG for the project.
-  Enter an unique name of the workspace. And then enter Managed RG name. This is not required but still for cluster managing purpose we are giving name to Databricks RG.
- Next, click on <b>Review + Create</b>.
- After validation, click on Create.
- Once completed, click on <b>Go to Resource</b>. Click on <b>Launch Workspace</b>.
- Once launched, check the left pane. There is an option <b>Compute</b>, click on it. This is basically a cluster under which our transformation will happen.
- Click on <b>Create Compute</b>. And select Single Node option. This will run whole data on a single node, but on multi-node data is broken into equal parts and then cluster is executed.
- Make <b>Access mode</b> as <b>No isolation shared</b>. And for <b>Runtime version</b>, select the new LTS version available.
- Next, uncheck the <b>Use Photon Acceleration</b>, this will reduce the CPU load and consumption.
- And for <b>Node type</b> select <b>Standard DS3 v2</b> which have 4 cores CPU which is more than enough for this project.
- Now, set the terminate time, which will basically take down the cluster after the mentioned time period. This helps in reduced cost.
- Click on <b>Compute</b>.

This will create a cluster which will execute the ETL process written on Databricks workspace. If the cluster is down then it will not execute the code written for transformation.

Since we have created our cluster and will be working with Databricks but there is a catch in this. We know raw data is saved in Datalake resource and Databricks will access this data for transformation. So, it will need an access to this resource.
- Go to Home and search <b>Microsoft Entra ID</b> and click on it.
- On the left pane, you will see many options but we need to app to be registered so that it can access the data. So, click on <b>App registrations</b>.
- Click on <b>New Registration</b>. Enter the name for the registration and click on <b>Register</b>.

Don't close the <b>Overview</b> pane as this will be needed while writing the code.
- Now under this registration, you can see <b>Certificates & secrets</b> under <b>Manage</b> drop down on left pane. Click on it.
- Click on New Client Secret and description to it.

Now, we have to give access to this app for the Datalake storage.
- Go to Home and select the storage account.
- Here you can see IAM access control, click on it.
- Now click on <b>+ Add</b> to add a role to that app.
- Then search <b>storage blob data contributor</b> and click on Next.
- Now, under Members field, we have to select the app name which we have created to assign it as a member so that it can have access to Datalake storage. Click on <b>select member</b>. Then search for the app name and select it.
- Then click <b>Review & Assign</b> to complete it.

Since we have now provided the access we can now build our Databricks script for transformation.
- Navigate to Databricks Studio and click on Workspace.
- Click on <b>Create</b> and enter the name of the folder & click Create.
- Navigate inside the folder and again click on <b>Create</b> and select <b>Notebook</b>.
- Now, you can see the UI which is similar to Jupyter Notebook.

On top right side, we can see Run All, Connect/Terminated, Schedule and Share buttons. Run All will execute whole script file at once. Connect is basically create a link with the cluster/compute we have created earlier. But before that we have to <b>Activate</b> our cluster/compute, so that Databricks can handle at how many nodes this script needs to be executed. Schedule as the name suggest, we can schedule a time when this script will be executed. So this can be Hourly, Daily or Weekly. And last but not the least, Share, it will basically provide access to the person to whom you want to share the script and also manage the read-write access.

Next at top, you can see by default, Python is selected. You can change the script language from the dropdown to SQL, Scala and R. Or you can change it from box field provided on the workspace. There you can see another option as Markdown. It is similar to HTML code, if you want to make a note that what will be the below code does then you can use this option.

<b>Note:</b>For Databricks script refer the <u>Silver Layer Transform</u> file on this repo.

Using the Databricks script, we have completed our second phase where we transformed our raw data and saved it in second layer container. Now we will use this transformed data which is in parquet format in our query script.

# 5. Create Synapse Analytics Resource
Synapse analytics is basically a unified platform for data integration, trasformation and Big Data Analysis. Here you can find in-built data factory, databricks script, analysis tools, serverless or dedicated database etc.
- From Home page, search synapse analytics and click on it.
- Click on <b>Create</b> and you will again see the subscription type, RG and managed RG name.
- Enter workspace name and then you have create a default storage account as Synapse use this for internal usage and default file system.
- Click on Next and then you will see some Authentication fields.
- Enter a SQL Server admin login name, password and confirm it. This will be used when we will be making a dedicated SQL server and any external app require access to that SQL database.
- Now move forward and check if Virtual Network is disabled or not. If enabled then select disable as we will not be working using virtual network.
- Now click finish creating Synapse resource and wait for validating and creation.

Now go to Home page, there you can see your Synapse resource and along with that the default storage. This can also be used for our data storage and Synapse will not require any app registration or access grant. But we generally don't use this, organization generally prefer an external storage system.
- Click on Synapse resource and click on <b>Open Synapse Studio</b>.

Now since we will be using an external storage other than default one, we require a permission just like Databricks. But as Databricks was an external app that is integrated in Azure, that require app permission and Synapse is an internal Microsoft app which does not require app permission, just the managed identity has to be given the permission.
- Go to Home Page, click on RG.
- We require access of Datalake, so click on it.
- Select IAM Access Control option.
- Click on <b>+ Add</b> option and select <b>Add role assignment</b>.
- Search for <b>Storage Blob Data Contributor</b> and select Continue.
- So, here earlier we have chosen User, group or service principal for assigning access. But for Synapse, we have to give access to the managed identity of it. So, select <b>Managed Identity</b>. This managed identity is by default created for all the in-built service of Microsoft.
- Now click on <b>select members</b>. This will open a side pane. There you can select the subscription and for which service's identity this access is required, select it. For our project we require it for Synapse and select it.
- Then select the synapse project workspace path. It will be added as the member.
- Click on <b>Review + assign</b>.

Now, we have provided the access to Synapse for our external storage and once it is visible on Roles tab, navigate to Synapse Studio.
- Click on <b>Data</b> option and the <b>+</b> icon.
- Select SQL database. Since we don't have any database to save our data in tables, we will be requiring this.
- Now a pane will appear on right side where we can see SQL pool type with options Serverless and dedicated. Select Serverless.
- Enter a name for database and click on Create.
- Once created, click on <b>Develop</b> option and then click on <b>+</b>icon and select SQL script.
- After that, you can see on top right there is an option called <b>Use Database</b>, by default master is selected.
- Click on it and select the db you just created.

Now, we will be reading data from our second layer storage and create a <b>View</b>. View you can simply understand that it has the preview of the raw data from the external storage in tables manner. It is not an actual table stored in database, it is a meta data of it on which we can apply our SQL queries.

<b>Note:</b> For the scripts you can refer to the rep.

Here, we require one more permission for ourself as our account will be accessing the data storage, so we will provide an access to ourself.
- Go to Home and click on datalake storage.
- Click on IAM Access Control.
- Click on <b>Add</b> and select <b>Add role assignment</b>.
- Search <b>Storage Blob Data Contributor</b>, select and Continue.
- Click on <b>select members</b>, and then select your Azure email id.
- Click on <b>Review + assign</b>.