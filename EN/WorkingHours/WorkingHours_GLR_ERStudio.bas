'----------
'- CASETALK GENERATED VBSCRIPT
'- PLEASE RUN INSIDE ERSTUDIO USING TOOLS\BASIC MACRO EDITOR
'----------

'----------
'- Project=WorkingHours.prj
'- Path=\\Mac\Home\Documents\CaseTalk\Models\EN\WorkingHours\
'- Description=A more realistic example where worksheets are verbalized and modeled. The model validation shows potential redundancy warnings.
'- 
'- Repository=\\Mac\Home\Documents\CaseTalk\Models\EN\WorkingHours\WorkingHours_GLR.igg
'- Author=BCP Software
'----------

Sub Main
Set MyDiagram = DiagramManager.NewDiagram
    MyDiagram.ProjectName = "WorkingHours"
    MyDiagram.Author = "BCP Software"
    MyDiagram.Description = "A more realistic example where worksheets are verbalized and modeled. The model validation shows potential redundancy warnings."
Set MyDictionary = MyDiagram.Dictionary
Set MyModel = MyDiagram.ActiveModel
    MyModel.Name = "WorkingHours_GLR"
    MyModel.SpaceHandling = 0

'Create Domains

Set Domain_amount_of_euros = MyDictionary.Domains.Add("AMOUNT_OF_EUROS", "amount_of_euros")
    Domain_amount_of_euros.DataType = "float"

Set Domain_amount_of_hours = MyDictionary.Domains.Add("AMOUNT_OF_HOURS", "amount_of_hours")
    Domain_amount_of_hours.DataType = "integer"

Set Domain_City = MyDictionary.Domains.Add("CITY", "City")
    Domain_City.DataType = "char"

Set Domain_customer_name = MyDictionary.Domains.Add("CUSTOMER_NAME", "customer_name")
    Domain_customer_name.DataType = "char"

Set Domain_customernumber = MyDictionary.Domains.Add("CUSTOMERNUMBER", "customernumber")
    Domain_customernumber.DataType = "integer"

Set Domain_description = MyDictionary.Domains.Add("DESCRIPTION", "description")
    Domain_description.DataType = "char"

Set Domain_division_name = MyDictionary.Domains.Add("DIVISION_NAME", "division_name")
    Domain_division_name.DataType = "char"

Set Domain_division_nr = MyDictionary.Domains.Add("DIVISION_NR", "division_nr")
    Domain_division_nr.DataType = "integer"

Set Domain_employee_no = MyDictionary.Domains.Add("EMPLOYEE_NO", "employee_no")
    Domain_employee_no.DataType = "integer"

Set Domain_person_name = MyDictionary.Domains.Add("PERSON_NAME", "person_name")
    Domain_person_name.DataType = "char"

Set Domain_project_no = MyDictionary.Domains.Add("PROJECT_NO", "project_no")
    Domain_project_no.DataType = "char"

Set Domain_task_name = MyDictionary.Domains.Add("TASK_NAME", "task_name")
    Domain_task_name.DataType = "char"

Set Domain_title_code = MyDictionary.Domains.Add("TITLE_CODE", "title_code")
    Domain_title_code.DataType = "char"
Set Rule_title_code = MyDictionary.Rules.Add("Rule_title_code", "@var in [""ing"", ""ir"", ""mr"", ""mrs"", ""ms""]"
    Domain_title_code.RuleId = Rule_title_code.ID

Set Domain_wbs_number = MyDictionary.Domains.Add("WBS_NUMBER", "wbs_number")
    Domain_wbs_number.DataType = "integer"

Set Domain_week_no = MyDictionary.Domains.Add("WEEK_NO", "week_no")
    Domain_week_no.DataType = "integer"

Set Domain_year_no = MyDictionary.Domains.Add("YEAR_NO", "year_no")
    Domain_year_no.DataType = "integer"

Set Domain_GENID = MyDictionary.Domains.Add("GENID", "GENID")
    Domain_GENID.DataType = "integer"
    Domain_GENID.Note ="Artificial key domain"

' Create entity for: Customer

Set Entity_Customer= MyModel.Entities.Add(200, 0)
    Entity_Customer.TableName = "CUSTOMER"
    Entity_Customer.EntityName = "Customer"
    Entity_Customer.Note ="what can this mean?" & vbCrLf & _
        "Customer <customernumber> has name <Name of Customer>."
Set Attribute_Customer_customernumber = Entity_Customer.Attributes.Add("customernumber", True)
    Attribute_Customer_customernumber.DomainId = Domain_customernumber.ID
    Attribute_Customer_customernumber.NullOption = "NOT NULL"
Set Attribute_Customer_Name_of_Customer = Entity_Customer.Attributes.Add("Name of Customer", False)
    Attribute_Customer_Name_of_Customer.DomainId = Domain_customer_name.ID
    Attribute_Customer_Name_of_Customer.LogicalRoleName = "Name of Customer"
    Attribute_Customer_Name_of_Customer.NullOption = "NOT NULL"
    Attribute_Customer_Name_of_Customer.Notes ="blablabla"

' Create entity for: Customer_Location

Set Entity_Customer_Location= MyModel.Entities.Add(400, 0)
    Entity_Customer_Location.TableName = "CUSTOMER_LOCATION"
    Entity_Customer_Location.EntityName = "Customer_Location"
    Entity_Customer_Location.Note ="Customer <Customer> is located in <City>."
Set Attribute_Customer_Location_City = Entity_Customer_Location.Attributes.Add("City", True)
    Attribute_Customer_Location_City.DomainId = Domain_City.ID
    Attribute_Customer_Location_City.NullOption = "NOT NULL"

' Create entity for: Division

Set Entity_Division= MyModel.Entities.Add(0, 200)
    Entity_Division.TableName = "DIVISION"
    Entity_Division.EntityName = "Division"
    Entity_Division.Note ="Division <division nr> has name <Name of Division>."
Set Attribute_Division_division_nr = Entity_Division.Attributes.Add("division nr", True)
    Attribute_Division_division_nr.DomainId = Domain_division_nr.ID
    Attribute_Division_division_nr.LogicalRoleName = "division nr"
    Attribute_Division_division_nr.NullOption = "NOT NULL"
Set Attribute_Division_Name_of_Division = Entity_Division.Attributes.Add("Name of Division", False)
    Attribute_Division_Name_of_Division.DomainId = Domain_division_name.ID
    Attribute_Division_Name_of_Division.LogicalRoleName = "Name of Division"
    Attribute_Division_Name_of_Division.NullOption = "NOT NULL"

' Create entity for: Employee

Set Entity_Employee= MyModel.Entities.Add(200, 200)
    Entity_Employee.TableName = "EMPLOYEE"
    Entity_Employee.EntityName = "Employee"
    Entity_Employee.Note ="Employee <employee no> has name <Employee Name>." & vbCrLf & _
        "Employee <employee no> has title <Title>." & vbCrLf & _
        "Employee <employee no> is arranged to division <Division>."
Set Attribute_Employee_employee_no = Entity_Employee.Attributes.Add("employee no", True)
    Attribute_Employee_employee_no.DomainId = Domain_employee_no.ID
    Attribute_Employee_employee_no.LogicalRoleName = "employee no"
    Attribute_Employee_employee_no.NullOption = "NOT NULL"
Set Attribute_Employee_Employee_Name = Entity_Employee.Attributes.Add("Employee Name", False)
    Attribute_Employee_Employee_Name.DomainId = Domain_person_name.ID
    Attribute_Employee_Employee_Name.LogicalRoleName = "Employee Name"
    Attribute_Employee_Employee_Name.NullOption = "NOT NULL"
Set Attribute_Employee_Title = Entity_Employee.Attributes.Add("Employee Title/Title", False)
    Attribute_Employee_Title.DomainId = Domain_title_code.ID
    Attribute_Employee_Title.LogicalRoleName = "Employee Title/Title"

' Create entity for: Hour_Rate

Set Entity_Hour_Rate= MyModel.Entities.Add(400, 200)
    Entity_Hour_Rate.TableName = "HOUR_RATE"
    Entity_Hour_Rate.EntityName = "Hour_Rate"
    Entity_Hour_Rate.Note ="From week <Year><week no> the hour rate for employee <Employee> working on project <Project> is EUR <Amount>."
Set Attribute_Hour_Rate_Year = Entity_Hour_Rate.Attributes.Add("Week/Year", True)
    Attribute_Hour_Rate_Year.DomainId = Domain_year_no.ID
    Attribute_Hour_Rate_Year.LogicalRoleName = "Week/Year"
    Attribute_Hour_Rate_Year.NullOption = "NOT NULL"
Set Attribute_Hour_Rate_week_no = Entity_Hour_Rate.Attributes.Add("Week/week no", True)
    Attribute_Hour_Rate_week_no.DomainId = Domain_week_no.ID
    Attribute_Hour_Rate_week_no.LogicalRoleName = "Week/week no"
    Attribute_Hour_Rate_week_no.NullOption = "NOT NULL"
Set Attribute_Hour_Rate_Amount = Entity_Hour_Rate.Attributes.Add("Amount", False)
    Attribute_Hour_Rate_Amount.DomainId = Domain_amount_of_euros.ID
    Attribute_Hour_Rate_Amount.NullOption = "NOT NULL"

' Create entity for: Project

Set Entity_Project= MyModel.Entities.Add(0, 400)
    Entity_Project.TableName = "PROJECT"
    Entity_Project.EntityName = "Project"
    Entity_Project.Note ="Project <project no> is the responsibility of division <Division>." & vbCrLf & _
        "Project <project no> is managed by employee <Employee>." & vbCrLf & _
        "Project <project no> is carried out for customer <Customer>." & vbCrLf & _
        "Project <project no> has description <Project Description>."
Set Attribute_Project_project_no = Entity_Project.Attributes.Add("project no", True)
    Attribute_Project_project_no.DomainId = Domain_project_no.ID
    Attribute_Project_project_no.LogicalRoleName = "project no"
    Attribute_Project_project_no.NullOption = "NOT NULL"
Set Attribute_Project_Project_Description = Entity_Project.Attributes.Add("Project Description", False)
    Attribute_Project_Project_Description.DomainId = Domain_description.ID
    Attribute_Project_Project_Description.LogicalRoleName = "Project Description"
    Attribute_Project_Project_Description.NullOption = "NOT NULL"
    Attribute_Project_Project_Description.Notes ="de clown"

' Create entity for: Work_Task

Set Entity_Work_Task= MyModel.Entities.Add(200, 400)
    Entity_Work_Task.TableName = "WORK_TASK"
    Entity_Work_Task.EntityName = "Work_Task"
    Entity_Work_Task.Note ="There is a Work Task with wbs code <wbs number>." & vbCrLf & _
        "Work task <wbs number> has name <Work Task Name>."
Set Attribute_Work_Task_wbs_number = Entity_Work_Task.Attributes.Add("wbs number", True)
    Attribute_Work_Task_wbs_number.DomainId = Domain_wbs_number.ID
    Attribute_Work_Task_wbs_number.LogicalRoleName = "wbs number"
    Attribute_Work_Task_wbs_number.NullOption = "NOT NULL"
Set Attribute_Work_Task_Work_Task_Name = Entity_Work_Task.Attributes.Add("Work Task Name", False)
    Attribute_Work_Task_Work_Task_Name.DomainId = Domain_task_name.ID
    Attribute_Work_Task_Work_Task_Name.LogicalRoleName = "Work Task Name"
    Attribute_Work_Task_Work_Task_Name.NullOption = "NOT NULL"

' Create entity for: Working_Hours

Set Entity_Working_Hours= MyModel.Entities.Add(400, 400)
    Entity_Working_Hours.TableName = "WORKING_HOURS"
    Entity_Working_Hours.EntityName = "Working_Hours"
    Entity_Working_Hours.Note ="In week <Year><week no> employee <Employee> working on project <Project> <amount of hours> hours at work task <Work Task> ."
Set Attribute_Working_Hours_Year = Entity_Working_Hours.Attributes.Add("Week/Year", True)
    Attribute_Working_Hours_Year.DomainId = Domain_year_no.ID
    Attribute_Working_Hours_Year.LogicalRoleName = "Week/Year"
    Attribute_Working_Hours_Year.NullOption = "NOT NULL"
Set Attribute_Working_Hours_week_no = Entity_Working_Hours.Attributes.Add("Week/week no", True)
    Attribute_Working_Hours_week_no.DomainId = Domain_week_no.ID
    Attribute_Working_Hours_week_no.LogicalRoleName = "Week/week no"
    Attribute_Working_Hours_week_no.NullOption = "NOT NULL"
Set Attribute_Working_Hours_amount_of_hours = Entity_Working_Hours.Attributes.Add("amount of hours", False)
    Attribute_Working_Hours_amount_of_hours.DomainId = Domain_amount_of_hours.ID
    Attribute_Working_Hours_amount_of_hours.LogicalRoleName = "amount of hours"
    Attribute_Working_Hours_amount_of_hours.NullOption = "NOT NULL"

' Creating Relationships

Set FK1_Working_Hours = MyModel.Relationships.AddWithRoleName( Entity_Work_Task.EntityName, Entity_Working_Hours.EntityName, 0, "wbs number,Work Task")
    FK1_Working_Hours.Name = "FK1_Working_Hours"
    FK1_Working_Hours.BusinessName = ""
    FK1_Working_Hours.CardinalityNo = 0

Set FK2_Project = MyModel.Relationships.AddWithRoleName( Entity_Division.EntityName, Entity_Project.EntityName, 1, "division nr,Responsible Division/Division")
    FK2_Project.Name = "FK2_Project"
    FK2_Project.BusinessName = "Responsible Division"
    FK2_Project.CardinalityNo = 0

Set FK3_Project = MyModel.Relationships.AddWithRoleName( Entity_Employee.EntityName, Entity_Project.EntityName, 3, "employee no,Project Manager/Employee")
    FK3_Project.Name = "FK3_Project"
    FK3_Project.BusinessName = "Project Manager"
    FK3_Project.CardinalityNo = 0

Set FK4_Project = MyModel.Relationships.AddWithRoleName( Entity_Customer.EntityName, Entity_Project.EntityName, 1, "customernumber,Customer Project/Customer")
    FK4_Project.Name = "FK4_Project"
    FK4_Project.BusinessName = "Customer Project"
    FK4_Project.CardinalityNo = 0

Set FK5_Employee = MyModel.Relationships.AddWithRoleName( Entity_Division.EntityName, Entity_Employee.EntityName, 1, "division nr,Division Employee/Division")
    FK5_Employee.Name = "FK5_Employee"
    FK5_Employee.BusinessName = "Division Employee"
    FK5_Employee.CardinalityNo = 0

Set FK6_Customer_Location = MyModel.Relationships.AddWithRoleName( Entity_Customer.EntityName, Entity_Customer_Location.EntityName, 0, "customernumber,Customer")
    FK6_Customer_Location.Name = "FK6_Customer_Location"
    FK6_Customer_Location.BusinessName = ""
    FK6_Customer_Location.CardinalityNo = 0

Set FK7_Working_Hours = MyModel.Relationships.AddWithRoleName( Entity_Employee.EntityName, Entity_Working_Hours.EntityName, 0, "employee no,Project Employee/Employee")
    FK7_Working_Hours.Name = "FK7_Working_Hours"
    FK7_Working_Hours.BusinessName = "Project Employee"
    FK7_Working_Hours.CardinalityNo = 0

Set FK8_Working_Hours = MyModel.Relationships.AddWithRoleName( Entity_Hour_Rate.EntityName, Entity_Working_Hours.EntityName, 2, "Project Employee/Employee,Project Employee/Employee;Project Employee/Project,Project Employee/Project")
    FK8_Working_Hours.Name = "FK8_Working_Hours"
    FK8_Working_Hours.BusinessName = "Project Employee"
    FK8_Working_Hours.CardinalityNo = 0
    FK8_Working_Hours.OptionalityValue = 1 ' It does not influence the existence property. ER/Studio bug?
    FK8_Working_Hours.Note = "Subset constraint: " & vbCrLf & "Project Employee in Working_Hours must exist in Hour_Rate."

Set FK9_Working_Hours = MyModel.Relationships.AddWithRoleName( Entity_Project.EntityName, Entity_Working_Hours.EntityName, 0, "project no,Project Employee/Project")
    FK9_Working_Hours.Name = "FK9_Working_Hours"
    FK9_Working_Hours.BusinessName = "Project Employee"
    FK9_Working_Hours.CardinalityNo = 0

Set FK10_Hour_Rate = MyModel.Relationships.AddWithRoleName( Entity_Employee.EntityName, Entity_Hour_Rate.EntityName, 0, "employee no,Project Employee/Employee")
    FK10_Hour_Rate.Name = "FK10_Hour_Rate"
    FK10_Hour_Rate.BusinessName = "Project Employee"
    FK10_Hour_Rate.CardinalityNo = 0

Set FK11_Hour_Rate = MyModel.Relationships.AddWithRoleName( Entity_Project.EntityName, Entity_Hour_Rate.EntityName, 0, "project no,Project Employee/Project")
    FK11_Hour_Rate.Name = "FK11_Hour_Rate"
    FK11_Hour_Rate.BusinessName = "Project Employee"
    FK11_Hour_Rate.CardinalityNo = 0

Set AK1_Customer = Entity_Customer.Indexes.Add("Name of Customer", "AK1_Customer")
Set AK1_Division = Entity_Division.Indexes.Add("Name of Division", "AK1_Division")
Set AK1_Work_Task = Entity_Work_Task.Indexes.Add("Work Task Name", "AK1_Work_Task")
Set AK1_Working_Hours = Entity_Working_Hours.Indexes.Add("Week/Year", "AK1_Working_Hours")
    AK1_Working_Hours.IndexColumns.Add("Week/week no")
    AK1_Working_Hours.IndexColumns.Add("Project Employee/Employee")
    AK1_Working_Hours.IndexColumns.Add("Project Employee/Project")
    AK1_Working_Hours.IndexColumns.Add("amount of hours")

Set View_Project_Employee = MyModel.Views.Add(0, 600) ' Wrongly positioned by ErStudio?
    View_Project_Employee.Name = "Project_Employee"
    View_Project_Employee.SetViewDDL("CREATE VIEW ""Project_Employee"" AS " & vbCrLf & _
      "SELECT DISTINCT " & vbCrLf & _
      """Project Employee/Employee"" AS ""Employee"" " & ","& vbCrLf & _
      """Project Employee/Project"" AS ""Project"" "& vbCrLf & _
      "FROM ""Working_Hours"" ")


Set View_Project_Manager = MyModel.Views.Add(200, 600) ' Wrongly positioned by ErStudio?
    View_Project_Manager.Name = "Project_Manager"
    View_Project_Manager.SetViewDDL("CREATE VIEW ""Project_Manager"" AS " & vbCrLf & _
      "SELECT DISTINCT " & vbCrLf & _
      """Project Manager/Employee"" AS ""Employee"" "& vbCrLf & _
      "FROM ""Project"" ")


Set View_Week = MyModel.Views.Add(400, 600) ' Wrongly positioned by ErStudio?
    View_Week.Name = "Week"
    View_Week.SetViewDDL("CREATE VIEW ""Week"" AS " & vbCrLf & _
      "SELECT " & vbCrLf & _
      """Week/Year"" AS ""Year"" " & ","& vbCrLf & _
      """Week/week no"" AS ""week_no"" "& vbCrLf & _
      "FROM ""Hour_Rate"" " & vbCrLf & _
      "UNION" & vbCrLf & _
      "SELECT " & vbCrLf & _
      """Week/Year"" AS ""Year"" " & ","& vbCrLf & _
      """Week/week no"" AS ""week_no"" "& vbCrLf & _
      "FROM ""Working_Hours"" ")


Set View_week_no = MyModel.Views.Add(0, 800) ' Wrongly positioned by ErStudio?
    View_week_no.Name = "week_no"
    View_week_no.SetViewDDL("CREATE VIEW ""week_no"" AS " & vbCrLf & _
      "SELECT " & vbCrLf & _
      """Week/week no"" AS ""week_no"" "& vbCrLf & _
      "FROM ""Hour_Rate"" " & vbCrLf & _
      "UNION" & vbCrLf & _
      "SELECT " & vbCrLf & _
      """Week/week no"" AS ""week_no"" "& vbCrLf & _
      "FROM ""Working_Hours"" ")


Set View_Year = MyModel.Views.Add(200, 800) ' Wrongly positioned by ErStudio?
    View_Year.Name = "Year"
    View_Year.SetViewDDL("CREATE VIEW ""Year"" AS " & vbCrLf & _
      "SELECT " & vbCrLf & _
      """Week/Year"" AS ""Year"" "& vbCrLf & _
      "FROM ""Hour_Rate"" " & vbCrLf & _
      "UNION" & vbCrLf & _
      "SELECT " & vbCrLf & _
      """Week/Year"" AS ""Year"" "& vbCrLf & _
      "FROM ""Working_Hours"" ")


End Sub
