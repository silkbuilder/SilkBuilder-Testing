# Building Your First SilkBuilder Application

This tutorial walks you through creating a fully functional SilkBuilder application and deploying it to a production server running SilkClient. By the end, you'll have a working people management app — complete with a data model, service layer, and a responsive UI — live in production.

---

## 1. Create a System

A **System** is the top-level container for your application's projects, data models, and services.

1. Open the SilkBuilder interface at `http://127.0.0.1:8080/SilkBuilder/` and sign in. The default password is `admin`.

2. Click the large **"+"** tile to open the **Add System** dialog.

3. Enter `People` as the **System Name** (or any name you prefer).

4. Under **Development Database**, select **MySQL**, then click **Add System**.

The new system appears as a card showing its name and creation date. Click it to enter the system manager.

---

## 2. Create a Project

Projects group related service pools, data models, and apps within a system.

1. In the system manager, click the **Projects** row to select it.
2. Click the **"+"** icon in the top-right corner of the list.
3. Set **Type** to `Project` and **Name** to `peopleManager`, then click **Submit**.

---

## 3. Define the Data Model (ORM)

SilkBuilder uses an Object-Relational Mapping (ORM) layer to define how your application interacts with the database. Data Models organize and group ORM objects.

### Create the Data Model Container

1. Select the **peopleManager** row, then click **"+"**.
2. Set **Type** to `Data Model` and **Name** to `Data Model`, then click **Submit**.

> In complex systems, each Data Model may be named to reflect its domain — e.g., `HR`, `Finance`, or `Inventory`.

### Add an ORM Table Object

1. Select the **Data Model** row, then click **"+"**.
2. Set **Type** to `ORM Table Object` and **Name** to `people`, then click **Submit**.

### Import the Schema via JSON

Rather than manually configuring each column, you can import a complete ORM definition from JSON:

1. Click the **pencil** icon on the `people` row to open the ORM editor.
2. When prompted to enter a table name, click **Cancel** — you'll import the definition instead.
3. Click the **Imp** button to open the **Import JSON** dialog.
4. Paste the following JSON into the text area and click **Import**:

```json
{"table":{"tableName":"person","pkMode":"Auto","insertAuthorization":"","updateAuthorization":"","deleteAuthorization":"","pkSql1":"","dbType":"0","description":"","editorDatabaseID":",2,","_recordIndex":0,"pkModeLabel":"Auto increment by database","developmentDatabaseID":"0","databaseController":"","dbSchema2":"`appdb`","pkSql2":"","dbSchema1":""},"column":[{"id":"6e6ab1fd-5f07-44ca-b37a-712ad3cab7e3","columnName":"personID","type":"I","columnTypeLabel":"Integer","pk":1,"role":"X","columnRoleLabel":"N.A.","sqlType2":"int","translation":"0","columnTranslationLabel":"None","_recordIndex":0},{"id":"2a162916-db95-4f56-a1ac-535328c80aaf","columnName":"name","type":"S","columnTypeLabel":"String","role":"X","columnRoleLabel":"N.A.","sqlType2":"varchar(100)","translation":"0","columnTranslationLabel":"None","_recordIndex":1},{"id":"0dd53255-0dc0-41e7-8a43-1fb1857269b2","columnName":"address","type":"S","columnTypeLabel":"String","role":"X","columnRoleLabel":"N.A.","sqlType2":"varchar(200)","translation":"0","columnTranslationLabel":"None","_recordIndex":2},{"id":"ea310e70-ace4-43a5-8f8b-022df9251a80","columnName":"phone","type":"S","columnTypeLabel":"String","role":"X","columnRoleLabel":"N.A.","sqlType2":"varchar(20)","translation":"0","columnTranslationLabel":"None","_recordIndex":3},{"id":"0d215f48-a9e1-4e5e-ba34-ae077c284a78","columnName":"email","type":"S","columnTypeLabel":"String","role":"X","columnRoleLabel":"N.A.","sqlType2":"varchar(50)","translation":"0","columnTranslationLabel":"None","_recordIndex":5},{"id":"52c8eb01-99ed-4369-a0ee-da555242b943","columnName":"married","type":"I","columnTypeLabel":"Integer","role":"X","columnRoleLabel":"N.A.","sqlType2":"tinyint","defaultValue2":"0","translation":"0","columnTranslationLabel":"None","_recordIndex":6},{"id":"22c4e8a4-9289-4141-8ca0-39ac66a824fe","columnName":"birthdate","type":"D","columnTypeLabel":"Date/Time","role":"X","columnRoleLabel":"N.A.","sqlType2":"timestamp","translation":"0","columnTranslationLabel":"None","_recordIndex":7},{"id":"532aa2c2-faf5-4044-ae7f-9aeb30670dca","columnName":"birthTime","type":"D","columnTypeLabel":"Date/Time","role":"X","columnRoleLabel":"N.A.","sqlType2":"time","translation":"0","columnTranslationLabel":"None","_recordIndex":8},{"id":"0d2c171d-f47d-408f-9805-9502bd14f748","columnName":"monthlyIncome","type":"N","columnTypeLabel":"Numeric","role":"X","columnRoleLabel":"N.A.","sqlType2":"decimal(10,2)","translation":"0","columnTranslationLabel":"None","_recordIndex":9},{"id":"99652e4d-b676-41de-991c-0925307f48a0","columnName":"comment","type":"S","columnTypeLabel":"String","role":"X","columnRoleLabel":"N.A.","sqlType2":"text","translation":"0","columnTranslationLabel":"None","_recordIndex":10}],"select":[{"selectName":"list","origin":"0","sql2":"select\n\t*\nfrom `appdb`.person","id":"be6419b3-ef13-4e86-9264-bab05577ad01","_recordIndex":0}],"operation":[],"authorization":[],"fk":[],"queryType":"SQL"}
```

---

## 4. Create the Database Table

With the ORM defined, SilkBuilder can generate the corresponding SQL DDL automatically.

1. Click the **TABLE > person** row.
2. Click the **SQL** button to open the **Create Table SQL** dialog.
3. Copy the generated SQL to your clipboard.
4. In your MySQL client, select the `appdb` database.
5. Paste and execute the SQL:

```sql
CREATE TABLE person (
    personID      INT PRIMARY KEY AUTO_INCREMENT,
    name          VARCHAR(100),
    address       VARCHAR(200),
    phone         VARCHAR(20),
    email         VARCHAR(50),
    married       TINYINT DEFAULT 0,
    birthdate     TIMESTAMP,
    birthTime     TIME,
    monthlyIncome DECIMAL(10,2),
    comment       TEXT
);
```

---

## 5. Create a Service Pool

A **Service Pool** groups related data outlets and application endpoints under a common service path.

1. Select the **peopleManager** row, then click **"+"**.
2. Set **Type** to `Service Pool` and **Name** to `list`, then click **Submit**.

---

## 6. Expose Data via a Data Outlet

A **Data Outlet** exposes an ORM over HTTP, enabling your front-end application to read and write data. Public outlets do not require user authentication — ideal for getting started quickly.

1. Select the **list** row, then click **"+"**.
2. Set **Type** to `Public Data Outlet` and **Name** to `peopleOutlet`, then click **Submit**.

> **Public vs. Private:** Private Data Outlets require authenticated sessions. For apps that handle sensitive data, always prefer Private outlets with a proper authentication flow.

3. Click the **pencil** icon on the `peopleOutlet` row to open the Outlet Editor.
4. In the **Select ORM** dialog, choose `/peopleManager/Data Model/people`. This binds your outlet to the ORM definition you imported earlier.
5. Click **Submit** to save. Your data is now accessible via a secure, web-facing endpoint.

---

## 7. Build the Application UI

SilkBuilder apps are authored in a declarative XML-based markup that compiles to responsive web interfaces.

1. Select the **list** row, then click **"+"**.
2. Set **Type** to `Public App` and **Name** to `index`, then click **Submit**.

> As with outlets, **Public Apps** skip authentication. For production apps with sensitive data, use **Private Apps** backed by a login flow.

3. Click the **pencil** icon on the `index` row to open the Code Editor.
4. Clear the existing placeholder code, paste the markup below, and click the **disk** icon to save:

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
			<silk:Header>
				People List
			</silk:Header>
			<silk:Content>
				<silk:Table id="peopleList" dataSource="peopleDP" targetPage="peopleFormPage">
					<silk:Column title="Name">{name}</silk:Column>
					<silk:Column title="Email">{email}</silk:Column>
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
			<silk:Header>
				Person Form
			</silk:Header>
			<silk:Content>
				<silk:Form id="peopleForm" dataSource="peopleList" buttonTarget="peopleListPage,peopleFormPage">
					<silk:Input id="name"          type="text"     label="Name" />
					<silk:Input id="address"       type="textarea" label="Address"        height="60px" />
					<silk:Input id="phone"         type="text"     label="Phone" />
					<silk:Input id="email"         type="email"    label="Email" />
					<silk:Input id="married"       type="checkbox" label="Married" />
					<silk:Input id="birthdate"     type="date"     label="Birthday" />
					<silk:Input id="birthTime"     type="time"     label="Birth Time" />
					<silk:Input id="monthlyIncome" type="decimal"  label="Monthly Income" />
					<silk:Input id="comment"       type="html"     label="Comment" />
				</silk:Form>
			</silk:Content>
		</silk:Page>
		
    </silk:Screen>

	<silk:DataProvider id="peopleDP" servicePath="/peopleManager/list/peopleOutlet" selectName="list" />

</silk:App>
```

### What this markup does

The app is composed of two responsive **Pages** that share the screen on larger viewports and stack on mobile:

- **`peopleListPage`** — displays a table of all people, driven by the `peopleDP` data provider. Clicking a row navigates to the form page.
- **`peopleFormPage`** — a full CRUD form bound to the selected table row, supporting add, edit, and delete operations.
- **`silk:DataProvider`** — wires the outlet you created (`/peopleManager/list/peopleOutlet`) to the UI components.

---

## 8. Run the Application

Click the **green play** icon to the right of the `index` row. The application opens in a new browser tab.

Use the toolbar actions to interact with your data:

| Icon | Action |
|------|--------|
| **+** | Add a new person |
| ✏️ | Edit an existing record |
| 🗑️ | Delete a record |

---

# Publishing to Production

With the application running in development, the next step is deploying it to a production SilkClient server.

Your target server at `http://127.0.0.1:8080/SilkClient/` should currently display:
**"Expecting code synchronization."**

---

## 9. Configure the System Login Link

1. In the system manager, click the **folder** icon next to the **Options** row to expand it.
2. Click the **edit** icon next to **System Setup**, then click the **pencil** icon to enter edit mode.
3. In the left panel, select the **index** row.
4. Click **Set Login Link**. This copies the application's path as the system entry point.

> Since this demo does not implement authentication, the public `index` app serves as the entry point. In authenticated systems, you would point this to a dedicated login screen.

5. Click **Submit** to save.

---

## 10. Register a Target Host

A **Target Host** is the SilkClient server that will receive your synchronized code.

1. Click the **"+"** icon next to the **Target Hosts** heading.
2. Enter the following values:
   - **Host URL:** `http://127.0.0.1:8080/SilkClient/`
   - **Access Token:** `5041a26e-572b-481d-929e-79254ca9e043` *(default installation token for testing)*
3. Click **Submit**, then **refresh the page** to load the registered host into the System Editor.

---

## 11. Synchronize Your Code

Code synchronization pushes your application artifacts from SilkBuilder to the target SilkClient server.

1. Select the **Projects** row from the list.
2. Click the **gear** icon in the top bar and choose **Sync Code**.
3. In the **Sync Process** dialog, confirm the SilkClient URL is pre-selected.
4. Click **Sync Code** and confirm to begin the transfer.
5. Once complete, a success notification will appear.

Navigate to `http://127.0.0.1:8080/SilkClient/` — your People Manager application is now live in production.

---

## Next Steps

You've built and deployed a complete SilkBuilder application from scratch. From here, you can:

- Add **authentication** using Private Apps and Private Data Outlets
- Define **relationships** between ORM objects for more complex data models
- Implement **custom SQL** queries in your Data Outlets for advanced filtering and reporting
- Explore **role-based authorization** to control access at the row and operation level

Full documentation is available at **[https://docs.silkbuilder.com](https://docs.silkbuilder.com)**
