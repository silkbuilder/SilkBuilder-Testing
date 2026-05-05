# Building the First Application
## Create a System

1. Access the builder at http://127.0.0.1:8080/SilkBuilder/ and enter the password; the default one is `admin` if you have not changed it yet. 

2. Click the box with the big "+" sign. This will open the "Add System" dialog window.

3. In the form, enter the System Name "People", or any name you choose. In the "Development Database", choose "MySQL". Then, click on the button "Add System."  The new system will appear in a box on the screen. It will show the system's name and the creation date.

4. Click on the newly created system to access the systems manager.

## The Project

1. On the systems manager, click the "Projects" row to select it. After that, click on the "+" icon located at the top right of the list. A form will open.
2. In the "Type" input, select "Project" from the dropdown list. Then, in the "Name" input, enter "peopleManager," and click the "Submit" button.

## The ORM

1. From the list, select the "peopleManager" row, then click the "+" icon.
2. In the "Type" input, select "Data Model", and in the "Name" input, enter also "Data Model". Data Models organize ORMs, and in complex systems, each Data Model may have different names to properly group or categorize the ORMs.
3. Select the created "Data Model" and click the "+" icon. In the "Type" input, select "ORM Table Object", and in the "Name" input, enter "people".
4. Click the pencil icon on the right side of the "people" row to open the ORM editor. By default, the editor expects you to enter the table name and other attributes. In this demo, we will not do that, so click the "Cancel" button.
5. Click on the button "Imp" to open the "Import JSON" window. Copy the provided JSON structure provided below into the window's text area. Then click on import. This will fill the ORM information.

```json
{"table":{"tableName":"person","pkMode":"Auto","insertAuthorization":"","updateAuthorization":"","deleteAuthorization":"","pkSql1":"","dbType":"0","description":"","editorDatabaseID":",2,","_recordIndex":0,"pkModeLabel":"Auto increment by database","developmentDatabaseID":"0","databaseController":"","dbSchema2":"`appdb`","pkSql2":"","dbSchema1":""},"column":[{"id":"6e6ab1fd-5f07-44ca-b37a-712ad3cab7e3","columnName":"personID","type":"I","columnTypeLabel":"Integer","pk":1,"role":"X","columnRoleLabel":"N.A.","sqlType2":"int","translation":"0","columnTranslationLabel":"None","_recordIndex":0},{"id":"5a24ba70-886e-4546-abe7-1d0c59b3abaa","columnName":"categoryID","type":"I","columnTypeLabel":"Integer","role":"X","columnRoleLabel":"N.A.","translation":"0","columnTranslationLabel":"None","_recordIndex":1,"sqlType2":"tinting"},{"id":"2a162916-db95-4f56-a1ac-535328c80aaf","columnName":"name","type":"S","columnTypeLabel":"String","role":"X","columnRoleLabel":"N.A.","sqlType2":"varcher(100)","translation":"0","columnTranslationLabel":"None","_recordIndex":2},{"id":"0dd53255-0dc0-41e7-8a43-1fb1857269b2","columnName":"address","type":"S","columnTypeLabel":"String","role":"X","columnRoleLabel":"N.A.","sqlType2":"varchar(200)","translation":"0","columnTranslationLabel":"None","_recordIndex":3},{"id":"ea310e70-ace4-43a5-8f8b-022df9251a80","columnName":"phone","type":"S","columnTypeLabel":"String","role":"X","columnRoleLabel":"N.A.","sqlType2":"varchar(20)","translation":"0","columnTranslationLabel":"None","_recordIndex":4},{"id":"0d215f48-a9e1-4e5e-ba34-ae077c284a78","columnName":"email","type":"S","columnTypeLabel":"String","role":"X","columnRoleLabel":"N.A.","sqlType2":"varchar(50)","translation":"0","columnTranslationLabel":"None","_recordIndex":5},{"id":"52c8eb01-99ed-4369-a0ee-da555242b943","columnName":"married","type":"I","columnTypeLabel":"Integer","role":"X","columnRoleLabel":"N.A.","sqlType2":"tinyint","defaultValue2":"0","translation":"0","columnTranslationLabel":"None","_recordIndex":6},{"id":"22c4e8a4-9289-4141-8ca0-39ac66a824fe","columnName":"birthdate","type":"D","columnTypeLabel":"Date/Time","role":"X","columnRoleLabel":"N.A.","sqlType2":"timestamp","translation":"0","columnTranslationLabel":"None","_recordIndex":7},{"id":"532aa2c2-faf5-4044-ae7f-9aeb30670dca","columnName":"birthTime","type":"D","columnTypeLabel":"Date/Time","role":"X","columnRoleLabel":"N.A.","sqlType2":"time","translation":"0","columnTranslationLabel":"None","_recordIndex":8},{"id":"0d2c171d-f47d-408f-9805-9502bd14f748","columnName":"monthlyIncome","type":"N","columnTypeLabel":"Numeric","role":"X","columnRoleLabel":"N.A.","sqlType2":"decimal(10,2)","translation":"0","columnTranslationLabel":"None","_recordIndex":9},{"id":"99652e4d-b676-41de-991c-0925307f48a0","columnName":"comment","type":"S","columnTypeLabel":"String","role":"X","columnRoleLabel":"N.A.","sqlType2":"text","translation":"0","columnTranslationLabel":"None","_recordIndex":10}],"select":[{"selectName":"list","origin":"0","sql2":"select\n\tpersonID,\n\tname,\n\taddress,\n\temail\nfrom `appdb`.testPerson","id":"be6419b3-ef13-4e86-9264-bab05577ad01","_recordIndex":0}],"operation":[],"authorization":[],"fk":[],"queryType":"SQL"}
```

6. Scan the ORM data to become familiar with it.

## Create the table

1. Click the row "TABLE > person".
2. Click the button "SQL". This will open the "Create Table SQL" window.
3. Copy the create table SQL to the clipboard.
4. In your MySQL client, select the database "appdb".
5. Paste the create table SQL and execute it.

```sql
create table person (
	personID int primary key auto_increment,
	categoryID tinting,
	name varcher(100),
	address varchar(200),
	phone varchar(20),
	email varchar(50),
	married tinyint default 0,
	birthdate timestamp,
	birthTime time,
	monthlyIncome decimal(10,2),
	comment text 
);
```

## The Service Pool

1. Click on the "peopleManager" row, and then click the "+" icon.
1. In the "Type" input, select "Service Pool", and in the "Name" input, enter "list". Then click the "Submit" button.

## The Data Outlet

1. Click on the "list" row, and then click the "+" icon.
2. In the "Type" input, select "Public Data Outlet". Private Data Outlets need user authentication. Since we won't implement authentication for our sample app, we'll use a Public Data Outlet that doesn't require authentication.
3. In the "Name" input, enter "peopleOutlet". Then click the "Submit" button.
4. Click the pencil icon on the right side of the "peopleOutlet" row. This will open the Outlet Editor.
5. The Outlet Editor will launch the "Select ORM" window. On it, select the "/peopleManager/Data Mode/people" ORM. This will load the ORM data into the Outlet Editor.
6. Don't change anything and click the "Submit" button. The Data Outlet enables the ORM to be accessed via the web. It incorporates many security features that are unnecessary for this basic demo.

## The Application

1. Click on the "list" row, and then click the "+" icon.
2. In the "Type" input, select "Public Add". Private Apps need user authentication. Since we won't implement authentication for our sample app, we'll use a Public App that doesn't require authentication.
3. In the "Name" input, enter "index". Then click the "Submit" button.
4. Click the pencil icon on the right side of the "index" row. This will open the Code Editor.
5. Copy the code below into the Code Editor and click the "disk" icon to save the code.

```xml
<java>@ taglib uri="/WEB-INF/silk.tld" prefix="silk" </java>
<java>@page contentType="text/html;charset=UTF-8" </java>
<silk:App title="People Manager">

    <silk:Screen>
		
		<silk:Page id="peopleListPage" stage="A1"
			smLayout="A1"
			mdLayout="A1"
			rgLayout="A1,A2:500px"
			lgLayout="A1,A2:500px"
			xlLayout="A1,A2:500px"
			xxLayout="A1,A2:500px"
		>
			<silk:Header >
				People List
			</silk:Header>
			<silk:Content>
				<silk:Table id="peopleList" dataSource="peopleDP" targetPage="peopleFormPage" >
					<silk:Column title="Name">{name}</silk:Column>
					<silk:Column title="Name">{email}</silk:Column>
				</silk:Table>
			</silk:Content>
		</silk:Page>
		
		<silk:Page id="peopleFormPage" stage="A2"
			smLayout="A2:*:b"
			mdLayout="A2:*:b"
			rgLayout="A1,A2:500px"
			lgLayout="A1,A2:500px"
			xlLayout="A1,A2:500px"
			xxLayout="A1,A2:500px"
		>
			<silk:Header >
				People Form
			</silk:Header>
			<silk:Content>
				<silk:Form id="peopleForm" dataSource="peopleList" buttonTest="peopleListPage,peopleFormPage" >
					<silk:Input id="name" type="text" label="Mame" />
					<silk:Input id="address" type="textarea" label="Address" />
					<silk:Input id="phone" type="text" label="Phone" />
					<silk:Input id="email" type="email" label="Email" />
					<silk:Input id="married" type="checkbox" label="Married" />
					<silk:Input id="birthDate" type="date" label="Birthday" />
					<silk:Input id="birthTime" type="time" label="Birth Time" />
					<silk:Input id="monthlyIncome" type="decimal" label="Monthly Income" />
					<silk:Input id="comment" type="html" label="comment" />
				</silk:Form>
			</silk:Content>
		</silk:Page>
		
    </silk:Screen>

	<silk:DataProvider id="peopleDP" servicePath="/peopleManager/list/peopleOutlet" selectName="list" />

</silk:App>
```

