'----------
'- CASETALK GENERATED VBSCRIPT
'- PLEASE RUN INSIDE POWERDESIGNER
'- (TOOLS\EXECUTE COMMAND\RUN SCRIPT)
'----------

'----------
'- Project=WorkingHours.prj
'- Path=\\Mac\Home\Documents\CaseTalk\Models\EN\WorkingHours\
'- Description=A more realistic example where worksheets are verbalized and modeled. The model validation shows potential redundancy warnings.
'- 
'- Repository=\\Mac\Home\Documents\CaseTalk\Models\EN\WorkingHours\WorkingHours_GLR.igg
'- Author=BCP Software
'----------

InteractiveMode = im_Batch

' Settings to tweak the runtime behaviour at runtime:
createAttributes = False ' DO NOT CHANGE THIS SETTING 

'PowerDesigner version specific defines:
 FullVersion = Version
 PdMajorVersion = CInt(Left(FullVersion, InStr(FullVersion, ".")-1))

' -------------------- 
' -- CONCEPTUAL MODEL -- 
' -------------------- 

Dim CDM
Set CDM = CreateModel(PdCDM.cls_Model)
    CDM.Name = "CDM_WorkingHours_GLR"
    CDM.Author = "BCP Software"
    CDM.code = CDM.Name
Set modelOptions = CDM.GetModelOptions
'    modelOptions.SynchronizeCodes = True ' keep codes in sync with names
    modelOptions.Notation = 0 ' ER, Includes Suptypes
createInheritance = (modelOptions.Notation = 0)

' Create model extension
if createAttributes then
  Dim ExtensionCDM
  set ExtensionCDM = CDM.ExtendedModelDefinitions.CreateNew()
  ExtensionCDM.Name = "CaseTalk Properties"
  ExtensionCDM.Comment = _
      "Contains CaseTalk model attributes" & vbLF & _
      "Created on " & vbDate
  DefineAttribute ExtensionCDM, "Data Warehouse", "History", 14
  DefineAttribute ExtensionCDM, "Source", "Department", 14
  DefineAttribute ExtensionCDM, "Source", "Interviewer", 14
  DefineAttribute ExtensionCDM, "Source", "Modeler", 14
  DefineAttribute ExtensionCDM, "Source", "DomainExpert", 14
  DefineAttribute ExtensionCDM, "Source", "Modified at", 14
  DefineAttribute ExtensionCDM, "Source", "Created at", 14
  DefineAttribute ExtensionCDM, "Task", "Status", 14
end if

'Create Domains

Set Domain_amount_of_euros = CDM.CreateObject(PdCDM.cls_domain)
    Domain_amount_of_euros.Name = "amount_of_euros"
    Domain_amount_of_euros.DisplayName = "amount_of_euros"
    Domain_amount_of_euros.Code = "Domain_amount_of_euros"
    Domain_amount_of_euros.DataType = "I"

Set Domain_amount_of_hours = CDM.CreateObject(PdCDM.cls_domain)
    Domain_amount_of_hours.Name = "amount_of_hours"
    Domain_amount_of_hours.DisplayName = "amount_of_hours"
    Domain_amount_of_hours.Code = "Domain_amount_of_hours"
    Domain_amount_of_hours.DataType = "I"

Set Domain_City = CDM.CreateObject(PdCDM.cls_domain)
    Domain_City.Name = "City"
    Domain_City.DisplayName = "City"
    Domain_City.Code = "Domain_City"
    Domain_City.DataType = "VA7"
    Domain_City.Length = 7

Set Domain_customer_name = CDM.CreateObject(PdCDM.cls_domain)
    Domain_customer_name.Name = "customer_name"
    Domain_customer_name.DisplayName = "customer_name"
    Domain_customer_name.Code = "Domain_customer_name"
    Domain_customer_name.DataType = "VA20"
    Domain_customer_name.Length = 20

Set Domain_customernumber = CDM.CreateObject(PdCDM.cls_domain)
    Domain_customernumber.Name = "customernumber"
    Domain_customernumber.DisplayName = "customernumber"
    Domain_customernumber.Code = "Domain_customernumber"
    Domain_customernumber.DataType = "I"

Set Domain_description = CDM.CreateObject(PdCDM.cls_domain)
    Domain_description.Name = "description"
    Domain_description.DisplayName = "description"
    Domain_description.Code = "Domain_description"
    Domain_description.DataType = "VA42"
    Domain_description.Length = 42

Set Domain_division_name = CDM.CreateObject(PdCDM.cls_domain)
    Domain_division_name.Name = "division_name"
    Domain_division_name.DisplayName = "division_name"
    Domain_division_name.Code = "Domain_division_name"
    Domain_division_name.DataType = "VA13"
    Domain_division_name.Length = 13

Set Domain_division_nr = CDM.CreateObject(PdCDM.cls_domain)
    Domain_division_nr.Name = "division_nr"
    Domain_division_nr.DisplayName = "division_nr"
    Domain_division_nr.Code = "Domain_division_nr"
    Domain_division_nr.DataType = "I"

Set Domain_employee_no = CDM.CreateObject(PdCDM.cls_domain)
    Domain_employee_no.Name = "employee_no"
    Domain_employee_no.DisplayName = "employee_no"
    Domain_employee_no.Code = "Domain_employee_no"
    Domain_employee_no.DataType = "I"

Set Domain_person_name = CDM.CreateObject(PdCDM.cls_domain)
    Domain_person_name.Name = "person_name"
    Domain_person_name.DisplayName = "person_name"
    Domain_person_name.Code = "Domain_person_name"
    Domain_person_name.DataType = "VA14"
    Domain_person_name.Length = 14

Set Domain_project_no = CDM.CreateObject(PdCDM.cls_domain)
    Domain_project_no.Name = "project_no"
    Domain_project_no.DisplayName = "project_no"
    Domain_project_no.Code = "Domain_project_no"
    Domain_project_no.DataType = "VA7"
    Domain_project_no.Length = 7

Set Domain_task_name = CDM.CreateObject(PdCDM.cls_domain)
    Domain_task_name.Name = "task_name"
    Domain_task_name.DisplayName = "task_name"
    Domain_task_name.Code = "Domain_task_name"
    Domain_task_name.DataType = "VA11"
    Domain_task_name.Length = 11
    if createAttributes then
      SetAttributeValue Domain_task_name, CDM, "Source", "Modeler", "marcow"
      SetAttributeValue Domain_task_name, CDM, "Source", "Modified at", "22-10-2017 21:41:07"
      SetAttributeValue Domain_task_name, CDM, "Source", "Created at", "3-10-2017 9:33:02"
    end if

Set Domain_title_code = CDM.CreateObject(PdCDM.cls_domain)
    Domain_title_code.Name = "title_code"
    Domain_title_code.DisplayName = "title_code"
    Domain_title_code.Code = "Domain_title_code"
    Domain_title_code.DataType = "VA3"
    Domain_title_code.Length = 3
    Domain_title_code.listofvalues = _
        "ing" & vbCrLf & _
        "ir" & vbCrLf & _
        "mr" & vbCrLf & _
        "mrs" & vbCrLf & _
        "ms"
    if createAttributes then
      SetAttributeValue Domain_title_code, CDM, "Source", "Modeler", "BCP Software"
      SetAttributeValue Domain_title_code, CDM, "Source", "Modified at", "8-1-2018 11:52:11"
      SetAttributeValue Domain_title_code, CDM, "Source", "Created at", "8-1-2018 11:52:11"
    end if

Set Domain_wbs_number = CDM.CreateObject(PdCDM.cls_domain)
    Domain_wbs_number.Name = "wbs_number"
    Domain_wbs_number.DisplayName = "wbs_number"
    Domain_wbs_number.Code = "Domain_wbs_number"
    Domain_wbs_number.DataType = "I"
    if createAttributes then
      SetAttributeValue Domain_wbs_number, CDM, "Source", "Modeler", "marcow"
      SetAttributeValue Domain_wbs_number, CDM, "Source", "Modified at", "15-9-2017 12:54:57"
      SetAttributeValue Domain_wbs_number, CDM, "Source", "Created at", "15-9-2017 12:54:57"
    end if

Set Domain_week_no = CDM.CreateObject(PdCDM.cls_domain)
    Domain_week_no.Name = "week_no"
    Domain_week_no.DisplayName = "week_no"
    Domain_week_no.Code = "Domain_week_no"
    Domain_week_no.DataType = "I"

Set Domain_year_no = CDM.CreateObject(PdCDM.cls_domain)
    Domain_year_no.Name = "year_no"
    Domain_year_no.DisplayName = "year_no"
    Domain_year_no.Code = "Domain_year_no"
    Domain_year_no.DataType = "I"

Set Domain_GENID = CDM.CreateObject(PdCDM.cls_domain)
    Domain_GENID.Name = "GENID"
    Domain_GENID.DisplayName = "GENID"
    Domain_GENID.Code = "Domain_GENID"
    Domain_GENID.DataType = "I"
    Domain_GENID.Comment = _
        "Artificial key domain"

' Create entity Customer

Set Entity_Customer = CDM.CreateObject(PdCDM.cls_Entity)
    Entity_Customer.Name = "Customer"
    Entity_Customer.DisplayName = "Customer"
    Entity_Customer.Code = "Entity_Customer"
    Entity_Customer.Comment = _
        "what can this mean?" & vbCrLf & _
        "Customer <customernumber> has name <Name of Customer>." & vbCrLf & _
        "-------------------" & vbCrLf & _
        "Example Population:" & vbCrLf & _
        "-------------------" & vbCrLf & _
        "customernumber;Name_of_Customer" & vbCrLf & _
        "4081;'District Limburg S.E'"
    if createAttributes then
      SetAttributeValue Entity_Customer.SetExtendedAttribute, CDM, "Data Warehouse", "History", "No history"
    end if
Set Attribute_Customer_customernumber = Entity_Customer.CreateObject(PdCDM.cls_EntityAttribute)
    Attribute_Customer_customernumber.Name = "customernumber"
    Attribute_Customer_customernumber.DisplayName = "customernumber"
    Attribute_Customer_customernumber.Code = "Attribute_Customer_customernumber"
    Attribute_Customer_customernumber.Domain = Domain_customernumber
    Attribute_Customer_customernumber.Mandatory = True
    Attribute_Customer_customernumber.Comment = _
        "customernumber"
Set Attribute_Customer_Name_of_Customer = Entity_Customer.CreateObject(PdCDM.cls_EntityAttribute)
    Attribute_Customer_Name_of_Customer.Name = "Name_of_Customer"
    Attribute_Customer_Name_of_Customer.DisplayName = "Name_of_Customer"
    Attribute_Customer_Name_of_Customer.Code = "Attribute_Customer_Name_of_Customer"
    Attribute_Customer_Name_of_Customer.Domain = Domain_customer_name
    Attribute_Customer_Name_of_Customer.Mandatory = True
    Attribute_Customer_Name_of_Customer.Comment = _
        "Name of Customer" & vbCrLf & _
        "blablabla"
set ID_Entity_Customer = Entity_Customer.Identifiers.CreateNew()
    ID_Entity_Customer.Name = "ID Customer"
    ID_Entity_Customer.PrimaryIdentifier = True
    ID_Entity_Customer.Attributes.Add( Attribute_Customer_customernumber)

' Create entity Customer_Location

Set Entity_Customer_Location = CDM.CreateObject(PdCDM.cls_Entity)
    Entity_Customer_Location.Name = "Customer_Location"
    Entity_Customer_Location.DisplayName = "Customer_Location"
    Entity_Customer_Location.Code = "Entity_Customer_Location"
    Entity_Customer_Location.Comment = _
        "Customer <Customer> is located in <City>." & vbCrLf & _
        "-------------------" & vbCrLf & _
        "Example Population:" & vbCrLf & _
        "-------------------" & vbCrLf & _
        "Customer;City" & vbCrLf & _
        "4081;'Utrecht'"
Set Attribute_Customer_Location_City = Entity_Customer_Location.CreateObject(PdCDM.cls_EntityAttribute)
    Attribute_Customer_Location_City.Name = "City"
    Attribute_Customer_Location_City.DisplayName = "City"
    Attribute_Customer_Location_City.Code = "Attribute_Customer_Location_City"
    Attribute_Customer_Location_City.Domain = Domain_City
    Attribute_Customer_Location_City.Mandatory = True
    Attribute_Customer_Location_City.Comment = _
        "City"

' Create entity Division

Set Entity_Division = CDM.CreateObject(PdCDM.cls_Entity)
    Entity_Division.Name = "Division"
    Entity_Division.DisplayName = "Division"
    Entity_Division.Code = "Entity_Division"
    Entity_Division.Comment = _
        "Division <division nr> has name <Name of Division>." & vbCrLf & _
        "-------------------" & vbCrLf & _
        "Example Population:" & vbCrLf & _
        "-------------------" & vbCrLf & _
        "division_nr;Name_of_Division" & vbCrLf & _
        "6;'Soil Research'"
Set Attribute_Division_division_nr = Entity_Division.CreateObject(PdCDM.cls_EntityAttribute)
    Attribute_Division_division_nr.Name = "division_nr"
    Attribute_Division_division_nr.DisplayName = "division_nr"
    Attribute_Division_division_nr.Code = "Attribute_Division_division_nr"
    Attribute_Division_division_nr.Domain = Domain_division_nr
    Attribute_Division_division_nr.Mandatory = True
    Attribute_Division_division_nr.Comment = _
        "division nr"
Set Attribute_Division_Name_of_Division = Entity_Division.CreateObject(PdCDM.cls_EntityAttribute)
    Attribute_Division_Name_of_Division.Name = "Name_of_Division"
    Attribute_Division_Name_of_Division.DisplayName = "Name_of_Division"
    Attribute_Division_Name_of_Division.Code = "Attribute_Division_Name_of_Division"
    Attribute_Division_Name_of_Division.Domain = Domain_division_name
    Attribute_Division_Name_of_Division.Mandatory = True
    Attribute_Division_Name_of_Division.Comment = _
        "Name of Division"
set ID_Entity_Division = Entity_Division.Identifiers.CreateNew()
    ID_Entity_Division.Name = "ID Division"
    ID_Entity_Division.PrimaryIdentifier = True
    ID_Entity_Division.Attributes.Add( Attribute_Division_division_nr)

' Create entity Employee

Set Entity_Employee = CDM.CreateObject(PdCDM.cls_Entity)
    Entity_Employee.Name = "Employee"
    Entity_Employee.DisplayName = "Employee"
    Entity_Employee.Code = "Entity_Employee"
    Entity_Employee.Comment = _
        "Employee <employee no> has name <Employee Name>." & vbCrLf & _
        "Employee <employee no> has title <Title>." & vbCrLf & _
        "Employee <employee no> is arranged to division <Division>." & vbCrLf & _
        "-------------------" & vbCrLf & _
        "Example Population:" & vbCrLf & _
        "-------------------" & vbCrLf & _
        "employee_no;Employee_Name;Title;Division" & vbCrLf & _
        "618;'Boven W.J. van';'ing';6"
Set Attribute_Employee_employee_no = Entity_Employee.CreateObject(PdCDM.cls_EntityAttribute)
    Attribute_Employee_employee_no.Name = "employee_no"
    Attribute_Employee_employee_no.DisplayName = "employee_no"
    Attribute_Employee_employee_no.Code = "Attribute_Employee_employee_no"
    Attribute_Employee_employee_no.Domain = Domain_employee_no
    Attribute_Employee_employee_no.Mandatory = True
    Attribute_Employee_employee_no.Comment = _
        "employee no"
Set Attribute_Employee_Employee_Name = Entity_Employee.CreateObject(PdCDM.cls_EntityAttribute)
    Attribute_Employee_Employee_Name.Name = "Employee_Name"
    Attribute_Employee_Employee_Name.DisplayName = "Employee_Name"
    Attribute_Employee_Employee_Name.Code = "Attribute_Employee_Employee_Name"
    Attribute_Employee_Employee_Name.Domain = Domain_person_name
    Attribute_Employee_Employee_Name.Mandatory = True
    Attribute_Employee_Employee_Name.Comment = _
        "Employee Name"
Set Attribute_Employee_Title = Entity_Employee.CreateObject(PdCDM.cls_EntityAttribute)
    Attribute_Employee_Title.Name = "Title"
    Attribute_Employee_Title.DisplayName = "Title"
    Attribute_Employee_Title.Code = "Attribute_Employee_Title"
    Attribute_Employee_Title.Domain = Domain_title_code
    Attribute_Employee_Title.Comment = _
        "Employee Title\Title"
set ID_Entity_Employee = Entity_Employee.Identifiers.CreateNew()
    ID_Entity_Employee.Name = "ID Employee"
    ID_Entity_Employee.PrimaryIdentifier = True
    ID_Entity_Employee.Attributes.Add( Attribute_Employee_employee_no)

' Create entity Hour_Rate

Set Entity_Hour_Rate = CDM.CreateObject(PdCDM.cls_Entity)
    Entity_Hour_Rate.Name = "Hour_Rate"
    Entity_Hour_Rate.DisplayName = "Hour_Rate"
    Entity_Hour_Rate.Code = "Entity_Hour_Rate"
    Entity_Hour_Rate.Comment = _
        "From week <Year><week no> the hour rate for employee <Employee> working on project <Project> is EUR <Amount>." & vbCrLf & _
        "-------------------" & vbCrLf & _
        "Example Population:" & vbCrLf & _
        "-------------------" & vbCrLf & _
        "Year;week_no;Employee;Project;Amount" & vbCrLf & _
        "2001;09;618;'6323.16';213,83" & vbCrLf & _
        "2001;38;312;'7004.07';164,00"
Set Attribute_Hour_Rate_Year = Entity_Hour_Rate.CreateObject(PdCDM.cls_EntityAttribute)
    Attribute_Hour_Rate_Year.Name = "Year"
    Attribute_Hour_Rate_Year.DisplayName = "Year"
    Attribute_Hour_Rate_Year.Code = "Attribute_Hour_Rate_Year"
    Attribute_Hour_Rate_Year.Domain = Domain_year_no
    Attribute_Hour_Rate_Year.Mandatory = True
    Attribute_Hour_Rate_Year.Comment = _
        "Week\Year"
Set Attribute_Hour_Rate_week_no = Entity_Hour_Rate.CreateObject(PdCDM.cls_EntityAttribute)
    Attribute_Hour_Rate_week_no.Name = "week_no"
    Attribute_Hour_Rate_week_no.DisplayName = "week_no"
    Attribute_Hour_Rate_week_no.Code = "Attribute_Hour_Rate_week_no"
    Attribute_Hour_Rate_week_no.Domain = Domain_week_no
    Attribute_Hour_Rate_week_no.Mandatory = True
    Attribute_Hour_Rate_week_no.Comment = _
        "Week\week no"
Set Attribute_Hour_Rate_Amount = Entity_Hour_Rate.CreateObject(PdCDM.cls_EntityAttribute)
    Attribute_Hour_Rate_Amount.Name = "Amount"
    Attribute_Hour_Rate_Amount.DisplayName = "Amount"
    Attribute_Hour_Rate_Amount.Code = "Attribute_Hour_Rate_Amount"
    Attribute_Hour_Rate_Amount.Domain = Domain_amount_of_euros
    Attribute_Hour_Rate_Amount.Mandatory = True
    Attribute_Hour_Rate_Amount.Comment = _
        "Amount"

' Create entity Project

Set Entity_Project = CDM.CreateObject(PdCDM.cls_Entity)
    Entity_Project.Name = "Project"
    Entity_Project.DisplayName = "Project"
    Entity_Project.Code = "Entity_Project"
    Entity_Project.Comment = _
        "Project <project no> is the responsibility of division <Division>." & vbCrLf & _
        "Project <project no> is managed by employee <Employee>." & vbCrLf & _
        "Project <project no> is carried out for customer <Customer>." & vbCrLf & _
        "Project <project no> has description <Project Description>." & vbCrLf & _
        "-------------------" & vbCrLf & _
        "Example Population:" & vbCrLf & _
        "-------------------" & vbCrLf & _
        "project_no;Division;Employee;Customer;Project_Description" & vbCrLf & _
        "'6323.16';6;283;4081;'Investigation of ...dumping site in Ulbach'"
Set Attribute_Project_project_no = Entity_Project.CreateObject(PdCDM.cls_EntityAttribute)
    Attribute_Project_project_no.Name = "project_no"
    Attribute_Project_project_no.DisplayName = "project_no"
    Attribute_Project_project_no.Code = "Attribute_Project_project_no"
    Attribute_Project_project_no.Domain = Domain_project_no
    Attribute_Project_project_no.Mandatory = True
    Attribute_Project_project_no.Comment = _
        "project no"
Set Attribute_Project_Project_Description = Entity_Project.CreateObject(PdCDM.cls_EntityAttribute)
    Attribute_Project_Project_Description.Name = "Project_Description"
    Attribute_Project_Project_Description.DisplayName = "Project_Description"
    Attribute_Project_Project_Description.Code = "Attribute_Project_Project_Description"
    Attribute_Project_Project_Description.Domain = Domain_description
    Attribute_Project_Project_Description.Mandatory = True
    Attribute_Project_Project_Description.Comment = _
        "Project Description" & vbCrLf & _
        "de clown"
set ID_Entity_Project = Entity_Project.Identifiers.CreateNew()
    ID_Entity_Project.Name = "ID Project"
    ID_Entity_Project.PrimaryIdentifier = True
    ID_Entity_Project.Attributes.Add( Attribute_Project_project_no)

' Create entity Work_Task

Set Entity_Work_Task = CDM.CreateObject(PdCDM.cls_Entity)
    Entity_Work_Task.Name = "Work_Task"
    Entity_Work_Task.DisplayName = "Work_Task"
    Entity_Work_Task.Code = "Entity_Work_Task"
    Entity_Work_Task.Comment = _
        "There is a Work Task with wbs code <wbs number>." & vbCrLf & _
        "Work task <wbs number> has name <Work Task Name>." & vbCrLf & _
        "-------------------" & vbCrLf & _
        "Example Population:" & vbCrLf & _
        "-------------------" & vbCrLf & _
        "wbs_number;Work_Task_Name" & vbCrLf & _
        "1;'preparation'" & vbCrLf & _
        "14;'drawing'"
Set Attribute_Work_Task_wbs_number = Entity_Work_Task.CreateObject(PdCDM.cls_EntityAttribute)
    Attribute_Work_Task_wbs_number.Name = "wbs_number"
    Attribute_Work_Task_wbs_number.DisplayName = "wbs_number"
    Attribute_Work_Task_wbs_number.Code = "Attribute_Work_Task_wbs_number"
    Attribute_Work_Task_wbs_number.Domain = Domain_wbs_number
    Attribute_Work_Task_wbs_number.Mandatory = True
    Attribute_Work_Task_wbs_number.Comment = _
        "wbs number"
Set Attribute_Work_Task_Work_Task_Name = Entity_Work_Task.CreateObject(PdCDM.cls_EntityAttribute)
    Attribute_Work_Task_Work_Task_Name.Name = "Work_Task_Name"
    Attribute_Work_Task_Work_Task_Name.DisplayName = "Work_Task_Name"
    Attribute_Work_Task_Work_Task_Name.Code = "Attribute_Work_Task_Work_Task_Name"
    Attribute_Work_Task_Work_Task_Name.Domain = Domain_task_name
    Attribute_Work_Task_Work_Task_Name.Mandatory = True
    Attribute_Work_Task_Work_Task_Name.Comment = _
        "Work Task Name"
set ID_Entity_Work_Task = Entity_Work_Task.Identifiers.CreateNew()
    ID_Entity_Work_Task.Name = "ID Work_Task"
    ID_Entity_Work_Task.PrimaryIdentifier = True
    ID_Entity_Work_Task.Attributes.Add( Attribute_Work_Task_wbs_number)

' Create entity Working_Hours

Set Entity_Working_Hours = CDM.CreateObject(PdCDM.cls_Entity)
    Entity_Working_Hours.Name = "Working_Hours"
    Entity_Working_Hours.DisplayName = "Working_Hours"
    Entity_Working_Hours.Code = "Entity_Working_Hours"
    Entity_Working_Hours.Comment = _
        "In week <Year><week no> employee <Employee> working on project <Project> <amount of hours> hours at work task <Work Task> ." & vbCrLf & _
        "-------------------" & vbCrLf & _
        "Example Population:" & vbCrLf & _
        "-------------------" & vbCrLf & _
        "Year;week_no;Employee;Project;Work_Task;amount_of_hours" & vbCrLf & _
        "2001;38;618;'7004.07';1;2" & vbCrLf & _
        "2001;38;232;'6323.16';14;4"
Set Attribute_Working_Hours_Year = Entity_Working_Hours.CreateObject(PdCDM.cls_EntityAttribute)
    Attribute_Working_Hours_Year.Name = "Year"
    Attribute_Working_Hours_Year.DisplayName = "Year"
    Attribute_Working_Hours_Year.Code = "Attribute_Working_Hours_Year"
    Attribute_Working_Hours_Year.Domain = Domain_year_no
    Attribute_Working_Hours_Year.Mandatory = True
    Attribute_Working_Hours_Year.Comment = _
        "Week\Year"
Set Attribute_Working_Hours_week_no = Entity_Working_Hours.CreateObject(PdCDM.cls_EntityAttribute)
    Attribute_Working_Hours_week_no.Name = "week_no"
    Attribute_Working_Hours_week_no.DisplayName = "week_no"
    Attribute_Working_Hours_week_no.Code = "Attribute_Working_Hours_week_no"
    Attribute_Working_Hours_week_no.Domain = Domain_week_no
    Attribute_Working_Hours_week_no.Mandatory = True
    Attribute_Working_Hours_week_no.Comment = _
        "Week\week no"
Set Attribute_Working_Hours_amount_of_hours = Entity_Working_Hours.CreateObject(PdCDM.cls_EntityAttribute)
    Attribute_Working_Hours_amount_of_hours.Name = "amount_of_hours"
    Attribute_Working_Hours_amount_of_hours.DisplayName = "amount_of_hours"
    Attribute_Working_Hours_amount_of_hours.Code = "Attribute_Working_Hours_amount_of_hours"
    Attribute_Working_Hours_amount_of_hours.Domain = Domain_amount_of_hours
    Attribute_Working_Hours_amount_of_hours.Mandatory = True
    Attribute_Working_Hours_amount_of_hours.Comment = _
        "amount of hours"

' Creating Relationships

Set FK1_Working_Hours = CDM.CreateObject(PdCDM.cls_relationship)
    FK1_Working_Hours.Name = "Working_Hours_Work_Task"
    FK1_Working_Hours.Code = "FK1_Working_Hours"
    FK1_Working_Hours.Entity1 = Entity_Work_Task
    FK1_Working_Hours.Entity2 = Entity_Working_Hours
    FK1_Working_Hours.DependentRole = "B"
    FK1_Working_Hours.Entity1ToEntity2Role = "Work Task"
    if PdMajorVersion < 11 then
    FK1_Working_Hours.Entity1ToEntity2RoleMinimumCardinality = "1"
    FK1_Working_Hours.Entity1ToEntity2RoleMaximumCardinality = "1"
    FK1_Working_Hours.Entity1ToEntity2RoleCardinality = "1..1"
    FK1_Working_Hours.Entity2ToEntity1RoleMinimumCardinality = "1"
    FK1_Working_Hours.Entity2ToEntity1RoleMaximumCardinality = "n"
    FK1_Working_Hours.Entity2ToEntity1RoleCardinality = "1..n"
    else
    FK1_Working_Hours.Entity2ToEntity1RoleMinimumCardinality = "1"
    FK1_Working_Hours.Entity2ToEntity1RoleMaximumCardinality = "1"
    FK1_Working_Hours.Entity2ToEntity1RoleCardinality = "1..1"
    FK1_Working_Hours.Entity1ToEntity2RoleMinimumCardinality = "1"
    FK1_Working_Hours.Entity1ToEntity2RoleMaximumCardinality = "n"
    FK1_Working_Hours.Entity1ToEntity2RoleCardinality = "1..n"
    end if

Set FK2_Project = CDM.CreateObject(PdCDM.cls_relationship)
    FK2_Project.Name = "Project_Division"
    FK2_Project.Code = "FK2_Project"
    FK2_Project.Entity1 = Entity_Division
    FK2_Project.Entity2 = Entity_Project
    FK2_Project.Entity1ToEntity2Role = "Responsible Division,Division"
    if PdMajorVersion < 11 then
    FK2_Project.Entity1ToEntity2RoleMinimumCardinality = "1"
    FK2_Project.Entity1ToEntity2RoleMaximumCardinality = "1"
    FK2_Project.Entity1ToEntity2RoleCardinality = "1..1"
    FK2_Project.Entity2ToEntity1RoleMinimumCardinality = "1"
    FK2_Project.Entity2ToEntity1RoleMaximumCardinality = "n"
    FK2_Project.Entity2ToEntity1RoleCardinality = "1..n"
    else
    FK2_Project.Entity2ToEntity1RoleMinimumCardinality = "1"
    FK2_Project.Entity2ToEntity1RoleMaximumCardinality = "1"
    FK2_Project.Entity2ToEntity1RoleCardinality = "1..1"
    FK2_Project.Entity1ToEntity2RoleMinimumCardinality = "1"
    FK2_Project.Entity1ToEntity2RoleMaximumCardinality = "n"
    FK2_Project.Entity1ToEntity2RoleCardinality = "1..n"
    end if

Set FK3_Project = CDM.CreateObject(PdCDM.cls_relationship)
    FK3_Project.Name = "Project_Employee"
    FK3_Project.Code = "FK3_Project"
    FK3_Project.Entity1 = Entity_Employee
    FK3_Project.Entity2 = Entity_Project
    FK3_Project.Entity1ToEntity2Role = "Project Manager,Employee"
    if PdMajorVersion < 11 then
    FK3_Project.Entity1ToEntity2RoleMinimumCardinality = "0"
    FK3_Project.Entity1ToEntity2RoleMaximumCardinality = "1"
    FK3_Project.Entity1ToEntity2RoleCardinality = "0..1"
    FK3_Project.Entity2ToEntity1RoleMinimumCardinality = "0"
    FK3_Project.Entity2ToEntity1RoleMaximumCardinality = "n"
    FK3_Project.Entity2ToEntity1RoleCardinality = "0..n"
    else
    FK3_Project.Entity2ToEntity1RoleMinimumCardinality = "0"
    FK3_Project.Entity2ToEntity1RoleMaximumCardinality = "1"
    FK3_Project.Entity2ToEntity1RoleCardinality = "0..1"
    FK3_Project.Entity1ToEntity2RoleMinimumCardinality = "0"
    FK3_Project.Entity1ToEntity2RoleMaximumCardinality = "n"
    FK3_Project.Entity1ToEntity2RoleCardinality = "0..n"
    end if

Set FK4_Project = CDM.CreateObject(PdCDM.cls_relationship)
    FK4_Project.Name = "Project_Customer"
    FK4_Project.Code = "FK4_Project"
    FK4_Project.Entity1 = Entity_Customer
    FK4_Project.Entity2 = Entity_Project
    FK4_Project.Entity1ToEntity2Role = "Customer Project,Customer"
    if PdMajorVersion < 11 then
    FK4_Project.Entity1ToEntity2RoleMinimumCardinality = "1"
    FK4_Project.Entity1ToEntity2RoleMaximumCardinality = "1"
    FK4_Project.Entity1ToEntity2RoleCardinality = "1..1"
    FK4_Project.Entity2ToEntity1RoleMinimumCardinality = "1"
    FK4_Project.Entity2ToEntity1RoleMaximumCardinality = "n"
    FK4_Project.Entity2ToEntity1RoleCardinality = "1..n"
    else
    FK4_Project.Entity2ToEntity1RoleMinimumCardinality = "1"
    FK4_Project.Entity2ToEntity1RoleMaximumCardinality = "1"
    FK4_Project.Entity2ToEntity1RoleCardinality = "1..1"
    FK4_Project.Entity1ToEntity2RoleMinimumCardinality = "1"
    FK4_Project.Entity1ToEntity2RoleMaximumCardinality = "n"
    FK4_Project.Entity1ToEntity2RoleCardinality = "1..n"
    end if

Set FK5_Employee = CDM.CreateObject(PdCDM.cls_relationship)
    FK5_Employee.Name = "Employee_Division"
    FK5_Employee.Code = "FK5_Employee"
    FK5_Employee.Entity1 = Entity_Division
    FK5_Employee.Entity2 = Entity_Employee
    FK5_Employee.Entity1ToEntity2Role = "Division Employee,Division"
    if PdMajorVersion < 11 then
    FK5_Employee.Entity1ToEntity2RoleMinimumCardinality = "1"
    FK5_Employee.Entity1ToEntity2RoleMaximumCardinality = "1"
    FK5_Employee.Entity1ToEntity2RoleCardinality = "1..1"
    FK5_Employee.Entity2ToEntity1RoleMinimumCardinality = "1"
    FK5_Employee.Entity2ToEntity1RoleMaximumCardinality = "n"
    FK5_Employee.Entity2ToEntity1RoleCardinality = "1..n"
    else
    FK5_Employee.Entity2ToEntity1RoleMinimumCardinality = "1"
    FK5_Employee.Entity2ToEntity1RoleMaximumCardinality = "1"
    FK5_Employee.Entity2ToEntity1RoleCardinality = "1..1"
    FK5_Employee.Entity1ToEntity2RoleMinimumCardinality = "1"
    FK5_Employee.Entity1ToEntity2RoleMaximumCardinality = "n"
    FK5_Employee.Entity1ToEntity2RoleCardinality = "1..n"
    end if

Set FK6_Customer_Location = CDM.CreateObject(PdCDM.cls_relationship)
    FK6_Customer_Location.Name = "Customer_Location_Customer"
    FK6_Customer_Location.Code = "FK6_Customer_Location"
    FK6_Customer_Location.Entity1 = Entity_Customer
    FK6_Customer_Location.Entity2 = Entity_Customer_Location
    FK6_Customer_Location.DependentRole = "B"
    FK6_Customer_Location.Entity1ToEntity2Role = "Customer"
    if PdMajorVersion < 11 then
    FK6_Customer_Location.Entity1ToEntity2RoleMinimumCardinality = "1"
    FK6_Customer_Location.Entity1ToEntity2RoleMaximumCardinality = "1"
    FK6_Customer_Location.Entity1ToEntity2RoleCardinality = "1..1"
    FK6_Customer_Location.Entity2ToEntity1RoleMinimumCardinality = "1"
    FK6_Customer_Location.Entity2ToEntity1RoleMaximumCardinality = "n"
    FK6_Customer_Location.Entity2ToEntity1RoleCardinality = "1..n"
    else
    FK6_Customer_Location.Entity2ToEntity1RoleMinimumCardinality = "1"
    FK6_Customer_Location.Entity2ToEntity1RoleMaximumCardinality = "1"
    FK6_Customer_Location.Entity2ToEntity1RoleCardinality = "1..1"
    FK6_Customer_Location.Entity1ToEntity2RoleMinimumCardinality = "1"
    FK6_Customer_Location.Entity1ToEntity2RoleMaximumCardinality = "n"
    FK6_Customer_Location.Entity1ToEntity2RoleCardinality = "1..n"
    end if

Set FK7_Working_Hours = CDM.CreateObject(PdCDM.cls_relationship)
    FK7_Working_Hours.Name = "Working_Hours_Employee"
    FK7_Working_Hours.Code = "FK7_Working_Hours"
    FK7_Working_Hours.Entity1 = Entity_Employee
    FK7_Working_Hours.Entity2 = Entity_Working_Hours
    FK7_Working_Hours.DependentRole = "B"
    FK7_Working_Hours.Entity1ToEntity2Role = "Project Employee,Employee"
    if PdMajorVersion < 11 then
    FK7_Working_Hours.Entity1ToEntity2RoleMinimumCardinality = "1"
    FK7_Working_Hours.Entity1ToEntity2RoleMaximumCardinality = "1"
    FK7_Working_Hours.Entity1ToEntity2RoleCardinality = "1..1"
    FK7_Working_Hours.Entity2ToEntity1RoleMinimumCardinality = "1"
    FK7_Working_Hours.Entity2ToEntity1RoleMaximumCardinality = "n"
    FK7_Working_Hours.Entity2ToEntity1RoleCardinality = "1..n"
    else
    FK7_Working_Hours.Entity2ToEntity1RoleMinimumCardinality = "1"
    FK7_Working_Hours.Entity2ToEntity1RoleMaximumCardinality = "1"
    FK7_Working_Hours.Entity2ToEntity1RoleCardinality = "1..1"
    FK7_Working_Hours.Entity1ToEntity2RoleMinimumCardinality = "1"
    FK7_Working_Hours.Entity1ToEntity2RoleMaximumCardinality = "n"
    FK7_Working_Hours.Entity1ToEntity2RoleCardinality = "1..n"
    end if

' Unsupported subset constraint on subtype
' FK8_Working_Hours
' From "Working_Hours" to "Hour_Rate"

Set FK9_Working_Hours = CDM.CreateObject(PdCDM.cls_relationship)
    FK9_Working_Hours.Name = "Working_Hours_Project"
    FK9_Working_Hours.Code = "FK9_Working_Hours"
    FK9_Working_Hours.Entity1 = Entity_Project
    FK9_Working_Hours.Entity2 = Entity_Working_Hours
    FK9_Working_Hours.DependentRole = "B"
    FK9_Working_Hours.Entity1ToEntity2Role = "Project Employee,Project"
    if PdMajorVersion < 11 then
    FK9_Working_Hours.Entity1ToEntity2RoleMinimumCardinality = "1"
    FK9_Working_Hours.Entity1ToEntity2RoleMaximumCardinality = "1"
    FK9_Working_Hours.Entity1ToEntity2RoleCardinality = "1..1"
    FK9_Working_Hours.Entity2ToEntity1RoleMinimumCardinality = "1"
    FK9_Working_Hours.Entity2ToEntity1RoleMaximumCardinality = "n"
    FK9_Working_Hours.Entity2ToEntity1RoleCardinality = "1..n"
    else
    FK9_Working_Hours.Entity2ToEntity1RoleMinimumCardinality = "1"
    FK9_Working_Hours.Entity2ToEntity1RoleMaximumCardinality = "1"
    FK9_Working_Hours.Entity2ToEntity1RoleCardinality = "1..1"
    FK9_Working_Hours.Entity1ToEntity2RoleMinimumCardinality = "1"
    FK9_Working_Hours.Entity1ToEntity2RoleMaximumCardinality = "n"
    FK9_Working_Hours.Entity1ToEntity2RoleCardinality = "1..n"
    end if

Set FK10_Hour_Rate = CDM.CreateObject(PdCDM.cls_relationship)
    FK10_Hour_Rate.Name = "Hour_Rate_Employee"
    FK10_Hour_Rate.Code = "FK10_Hour_Rate"
    FK10_Hour_Rate.Entity1 = Entity_Employee
    FK10_Hour_Rate.Entity2 = Entity_Hour_Rate
    FK10_Hour_Rate.DependentRole = "B"
    FK10_Hour_Rate.Entity1ToEntity2Role = "Project Employee,Employee"
    if PdMajorVersion < 11 then
    FK10_Hour_Rate.Entity1ToEntity2RoleMinimumCardinality = "1"
    FK10_Hour_Rate.Entity1ToEntity2RoleMaximumCardinality = "1"
    FK10_Hour_Rate.Entity1ToEntity2RoleCardinality = "1..1"
    FK10_Hour_Rate.Entity2ToEntity1RoleMinimumCardinality = "1"
    FK10_Hour_Rate.Entity2ToEntity1RoleMaximumCardinality = "n"
    FK10_Hour_Rate.Entity2ToEntity1RoleCardinality = "1..n"
    else
    FK10_Hour_Rate.Entity2ToEntity1RoleMinimumCardinality = "1"
    FK10_Hour_Rate.Entity2ToEntity1RoleMaximumCardinality = "1"
    FK10_Hour_Rate.Entity2ToEntity1RoleCardinality = "1..1"
    FK10_Hour_Rate.Entity1ToEntity2RoleMinimumCardinality = "1"
    FK10_Hour_Rate.Entity1ToEntity2RoleMaximumCardinality = "n"
    FK10_Hour_Rate.Entity1ToEntity2RoleCardinality = "1..n"
    end if

Set FK11_Hour_Rate = CDM.CreateObject(PdCDM.cls_relationship)
    FK11_Hour_Rate.Name = "Hour_Rate_Project"
    FK11_Hour_Rate.Code = "FK11_Hour_Rate"
    FK11_Hour_Rate.Entity1 = Entity_Project
    FK11_Hour_Rate.Entity2 = Entity_Hour_Rate
    FK11_Hour_Rate.DependentRole = "B"
    FK11_Hour_Rate.Entity1ToEntity2Role = "Project Employee,Project"
    if PdMajorVersion < 11 then
    FK11_Hour_Rate.Entity1ToEntity2RoleMinimumCardinality = "1"
    FK11_Hour_Rate.Entity1ToEntity2RoleMaximumCardinality = "1"
    FK11_Hour_Rate.Entity1ToEntity2RoleCardinality = "1..1"
    FK11_Hour_Rate.Entity2ToEntity1RoleMinimumCardinality = "1"
    FK11_Hour_Rate.Entity2ToEntity1RoleMaximumCardinality = "n"
    FK11_Hour_Rate.Entity2ToEntity1RoleCardinality = "1..n"
    else
    FK11_Hour_Rate.Entity2ToEntity1RoleMinimumCardinality = "1"
    FK11_Hour_Rate.Entity2ToEntity1RoleMaximumCardinality = "1"
    FK11_Hour_Rate.Entity2ToEntity1RoleCardinality = "1..1"
    FK11_Hour_Rate.Entity1ToEntity2RoleMinimumCardinality = "1"
    FK11_Hour_Rate.Entity1ToEntity2RoleMaximumCardinality = "n"
    FK11_Hour_Rate.Entity1ToEntity2RoleCardinality = "1..n"
    end if

' Create Inheritances

if createInheritance then
'else
'    Entity_Hour_Rate.ParentEntity = Entity_Project
end if

' Create Diagram and Add Symbols
Dim CDD
    if CDM.ConceptualDiagrams.count = 1 then
      Set CDD = CDM.ConceptualDiagrams.Item(0) 
    end if
    if CDD is nothing then
      Set CDD = CDM.CreateObject(PdCDM.cls_ConceptualDiagram)
    end if
    CDD.Name = "Full Diagram"
    CDD.SetAsDefault = true
    CDD.AttachAllObjects
    CDD.AutoLayout()
    CDD.OpenView()


' -------------------- 
' -- PHYSICAL MODEL -- 
' -------------------- 

Dim PDM
Set PDM = CreateModel(PdPDM.cls_Model)
    PDM.Name = "PDM_WorkingHours_GLR"
    PDM.Author = "BCP Software"
    PDM.code = PDM.Name
Set modelOptions = PDM.GetModelOptions
'    modelOptions.SynchronizeCodes = True ' keep codes in sync with names
    PDM.GenerationOrigins.Add CDM
createInheritance = False

' Create model extension
if createAttributes then
  Dim ExtensionPDM
  set ExtensionPDM = PDM.ExtendedModelDefinitions.CreateNew()
  ExtensionPDM.Name = "CaseTalk Properties"
  ExtensionPDM.Comment = _
      "Contains CaseTalk model attributes" & vbLF & _
      "Created on " & vbDate
  DefineAttribute ExtensionPDM, "Data Warehouse", "History", 14
  DefineAttribute ExtensionPDM, "Source", "Department", 14
  DefineAttribute ExtensionPDM, "Source", "Interviewer", 14
  DefineAttribute ExtensionPDM, "Source", "Modeler", 14
  DefineAttribute ExtensionPDM, "Source", "DomainExpert", 14
  DefineAttribute ExtensionPDM, "Source", "Modified at", 14
  DefineAttribute ExtensionPDM, "Source", "Created at", 14
  DefineAttribute ExtensionPDM, "Task", "Status", 14
end if

'Create Domains

Set Domain_amount_of_euros = PDM.CreateObject(PdPDM.cls_PhysicalDomain)
    Domain_amount_of_euros.Name = "amount_of_euros"
    Domain_amount_of_euros.DisplayName = "amount_of_euros"
    Domain_amount_of_euros.Code = "Domain_amount_of_euros"
    if PdMajorVersion < 11 then
    Domain_amount_of_euros.DataType = "I"
    else
    Domain_amount_of_euros.ConceptualDataType = "I"
    end if

Set Domain_amount_of_hours = PDM.CreateObject(PdPDM.cls_PhysicalDomain)
    Domain_amount_of_hours.Name = "amount_of_hours"
    Domain_amount_of_hours.DisplayName = "amount_of_hours"
    Domain_amount_of_hours.Code = "Domain_amount_of_hours"
    if PdMajorVersion < 11 then
    Domain_amount_of_hours.DataType = "I"
    else
    Domain_amount_of_hours.ConceptualDataType = "I"
    end if

Set Domain_City = PDM.CreateObject(PdPDM.cls_PhysicalDomain)
    Domain_City.Name = "City"
    Domain_City.DisplayName = "City"
    Domain_City.Code = "Domain_City"
    if PdMajorVersion < 11 then
    Domain_City.DataType = "VA7"
    Domain_City.Length = 7
    else
    Domain_City.ConceptualDataType = "VA7"
    end if

Set Domain_customer_name = PDM.CreateObject(PdPDM.cls_PhysicalDomain)
    Domain_customer_name.Name = "customer_name"
    Domain_customer_name.DisplayName = "customer_name"
    Domain_customer_name.Code = "Domain_customer_name"
    if PdMajorVersion < 11 then
    Domain_customer_name.DataType = "VA20"
    Domain_customer_name.Length = 20
    else
    Domain_customer_name.ConceptualDataType = "VA20"
    end if

Set Domain_customernumber = PDM.CreateObject(PdPDM.cls_PhysicalDomain)
    Domain_customernumber.Name = "customernumber"
    Domain_customernumber.DisplayName = "customernumber"
    Domain_customernumber.Code = "Domain_customernumber"
    if PdMajorVersion < 11 then
    Domain_customernumber.DataType = "I"
    else
    Domain_customernumber.ConceptualDataType = "I"
    end if

Set Domain_description = PDM.CreateObject(PdPDM.cls_PhysicalDomain)
    Domain_description.Name = "description"
    Domain_description.DisplayName = "description"
    Domain_description.Code = "Domain_description"
    if PdMajorVersion < 11 then
    Domain_description.DataType = "VA42"
    Domain_description.Length = 42
    else
    Domain_description.ConceptualDataType = "VA42"
    end if

Set Domain_division_name = PDM.CreateObject(PdPDM.cls_PhysicalDomain)
    Domain_division_name.Name = "division_name"
    Domain_division_name.DisplayName = "division_name"
    Domain_division_name.Code = "Domain_division_name"
    if PdMajorVersion < 11 then
    Domain_division_name.DataType = "VA13"
    Domain_division_name.Length = 13
    else
    Domain_division_name.ConceptualDataType = "VA13"
    end if

Set Domain_division_nr = PDM.CreateObject(PdPDM.cls_PhysicalDomain)
    Domain_division_nr.Name = "division_nr"
    Domain_division_nr.DisplayName = "division_nr"
    Domain_division_nr.Code = "Domain_division_nr"
    if PdMajorVersion < 11 then
    Domain_division_nr.DataType = "I"
    else
    Domain_division_nr.ConceptualDataType = "I"
    end if

Set Domain_employee_no = PDM.CreateObject(PdPDM.cls_PhysicalDomain)
    Domain_employee_no.Name = "employee_no"
    Domain_employee_no.DisplayName = "employee_no"
    Domain_employee_no.Code = "Domain_employee_no"
    if PdMajorVersion < 11 then
    Domain_employee_no.DataType = "I"
    else
    Domain_employee_no.ConceptualDataType = "I"
    end if

Set Domain_person_name = PDM.CreateObject(PdPDM.cls_PhysicalDomain)
    Domain_person_name.Name = "person_name"
    Domain_person_name.DisplayName = "person_name"
    Domain_person_name.Code = "Domain_person_name"
    if PdMajorVersion < 11 then
    Domain_person_name.DataType = "VA14"
    Domain_person_name.Length = 14
    else
    Domain_person_name.ConceptualDataType = "VA14"
    end if

Set Domain_project_no = PDM.CreateObject(PdPDM.cls_PhysicalDomain)
    Domain_project_no.Name = "project_no"
    Domain_project_no.DisplayName = "project_no"
    Domain_project_no.Code = "Domain_project_no"
    if PdMajorVersion < 11 then
    Domain_project_no.DataType = "VA7"
    Domain_project_no.Length = 7
    else
    Domain_project_no.ConceptualDataType = "VA7"
    end if

Set Domain_task_name = PDM.CreateObject(PdPDM.cls_PhysicalDomain)
    Domain_task_name.Name = "task_name"
    Domain_task_name.DisplayName = "task_name"
    Domain_task_name.Code = "Domain_task_name"
    if PdMajorVersion < 11 then
    Domain_task_name.DataType = "VA11"
    Domain_task_name.Length = 11
    else
    Domain_task_name.ConceptualDataType = "VA11"
    end if
    if createAttributes then
      SetAttributeValue Domain_task_name, PDM, "Source", "Modeler", "marcow"
      SetAttributeValue Domain_task_name, PDM, "Source", "Modified at", "22-10-2017 21:41:07"
      SetAttributeValue Domain_task_name, PDM, "Source", "Created at", "3-10-2017 9:33:02"
    end if

Set Domain_title_code = PDM.CreateObject(PdPDM.cls_PhysicalDomain)
    Domain_title_code.Name = "title_code"
    Domain_title_code.DisplayName = "title_code"
    Domain_title_code.Code = "Domain_title_code"
    if PdMajorVersion < 11 then
    Domain_title_code.DataType = "VA3"
    Domain_title_code.Length = 3
    else
    Domain_title_code.ConceptualDataType = "VA3"
    end if
    Domain_title_code.listofvalues = _
        "ing" & vbCrLf & _
        "ir" & vbCrLf & _
        "mr" & vbCrLf & _
        "mrs" & vbCrLf & _
        "ms"
    if createAttributes then
      SetAttributeValue Domain_title_code, PDM, "Source", "Modeler", "BCP Software"
      SetAttributeValue Domain_title_code, PDM, "Source", "Modified at", "8-1-2018 11:52:11"
      SetAttributeValue Domain_title_code, PDM, "Source", "Created at", "8-1-2018 11:52:11"
    end if

Set Domain_wbs_number = PDM.CreateObject(PdPDM.cls_PhysicalDomain)
    Domain_wbs_number.Name = "wbs_number"
    Domain_wbs_number.DisplayName = "wbs_number"
    Domain_wbs_number.Code = "Domain_wbs_number"
    if PdMajorVersion < 11 then
    Domain_wbs_number.DataType = "I"
    else
    Domain_wbs_number.ConceptualDataType = "I"
    end if
    if createAttributes then
      SetAttributeValue Domain_wbs_number, PDM, "Source", "Modeler", "marcow"
      SetAttributeValue Domain_wbs_number, PDM, "Source", "Modified at", "15-9-2017 12:54:57"
      SetAttributeValue Domain_wbs_number, PDM, "Source", "Created at", "15-9-2017 12:54:57"
    end if

Set Domain_week_no = PDM.CreateObject(PdPDM.cls_PhysicalDomain)
    Domain_week_no.Name = "week_no"
    Domain_week_no.DisplayName = "week_no"
    Domain_week_no.Code = "Domain_week_no"
    if PdMajorVersion < 11 then
    Domain_week_no.DataType = "I"
    else
    Domain_week_no.ConceptualDataType = "I"
    end if

Set Domain_year_no = PDM.CreateObject(PdPDM.cls_PhysicalDomain)
    Domain_year_no.Name = "year_no"
    Domain_year_no.DisplayName = "year_no"
    Domain_year_no.Code = "Domain_year_no"
    if PdMajorVersion < 11 then
    Domain_year_no.DataType = "I"
    else
    Domain_year_no.ConceptualDataType = "I"
    end if

Set Domain_GENID = PDM.CreateObject(PdPDM.cls_PhysicalDomain)
    Domain_GENID.Name = "GENID"
    Domain_GENID.DisplayName = "GENID"
    Domain_GENID.Code = "Domain_GENID"
    if PdMajorVersion < 11 then
    Domain_GENID.DataType = "I"
    else
    Domain_GENID.ConceptualDataType = "I"
    end if
    Domain_GENID.Comment = _
        "Artificial key domain"

' Create table Customer

Set Table_Customer = PDM.CreateObject(PdPDM.cls_table)
    Table_Customer.Name = "Customer"
    Table_Customer.DisplayName = "Customer"
    Table_Customer.Code = "Table_Customer"
    Table_Customer.Comment = _
        "what can this mean?" & vbCrLf & _
        "Customer <customernumber> has name <Name of Customer>." & vbCrLf & _
        "-------------------" & vbCrLf & _
        "Example Population:" & vbCrLf & _
        "-------------------" & vbCrLf & _
        "customernumber;Name_of_Customer" & vbCrLf & _
        "4081;'District Limburg S.E'"
    if createAttributes then
      SetAttributeValue Table_Customer.SetExtendedAttribute, PDM, "Data Warehouse", "History", "No history"
    end if
Set Column_Customer_customernumber = Table_Customer.CreateObject(PdPDM.cls_Column)
    Column_Customer_customernumber.Name = "customernumber"
    Column_Customer_customernumber.DisplayName = "customernumber"
    Column_Customer_customernumber.Code = "Column_Customer_customernumber"
    Column_Customer_customernumber.Domain = Domain_customernumber
    Column_Customer_customernumber.Mandatory = True
    Column_Customer_customernumber.Comment = _
        "customernumber"
Set Column_Customer_Name_of_Customer = Table_Customer.CreateObject(PdPDM.cls_Column)
    Column_Customer_Name_of_Customer.Name = "Name_of_Customer"
    Column_Customer_Name_of_Customer.DisplayName = "Name_of_Customer"
    Column_Customer_Name_of_Customer.Code = "Column_Customer_Name_of_Customer"
    Column_Customer_Name_of_Customer.Domain = Domain_customer_name
    Column_Customer_Name_of_Customer.Mandatory = True
    Column_Customer_Name_of_Customer.Comment = _
        "Name of Customer" & vbCrLf & _
        "blablabla"
set PK_Table_Customer = Table_Customer.Keys.CreateNew()
    PK_Table_Customer.Name = "PK Customer"
    PK_Table_Customer.Primary = True
    PK_Table_Customer.Columns.Add( Column_Customer_customernumber)
Set AK1_Customer = Table_Customer.Keys.CreateNew()
    AK1_Customer.Primary = false
    AK1_Customer.Name = "AK1 Customer"
    AK1_Customer.Columns.Add( Column_Customer_Name_of_Customer )
Set PI_Customer = Table_Customer.Indexes.CreateNew()
    PI_Customer.Name = "PI_Customer"
    PI_Customer.LinkedObject = PK_Table_Customer
Set AI1_Customer = Table_Customer.Indexes.CreateNew()
    AI1_Customer.Name = "AI1_Customer"
Set AI1_Customer_C1 = AI1_Customer.IndexColumns.CreateNew()
    AI1_Customer_C1.Column = Column_Customer_Name_of_Customer

' Create table Customer_Location

Set Table_Customer_Location = PDM.CreateObject(PdPDM.cls_table)
    Table_Customer_Location.Name = "Customer_Location"
    Table_Customer_Location.DisplayName = "Customer_Location"
    Table_Customer_Location.Code = "Table_Customer_Location"
    Table_Customer_Location.Comment = _
        "Customer <Customer> is located in <City>." & vbCrLf & _
        "-------------------" & vbCrLf & _
        "Example Population:" & vbCrLf & _
        "-------------------" & vbCrLf & _
        "Customer;City" & vbCrLf & _
        "4081;'Utrecht'"
Set Column_Customer_Location_Customer = Table_Customer_Location.CreateObject(PdPDM.cls_Column)
    Column_Customer_Location_Customer.Name = "Customer"
    Column_Customer_Location_Customer.DisplayName = "Customer"
    Column_Customer_Location_Customer.Code = "Column_Customer_Location_Customer"
    Column_Customer_Location_Customer.Domain = Domain_customernumber
    Column_Customer_Location_Customer.Mandatory = True
    Column_Customer_Location_Customer.Comment = _
        "Customer"
Set Column_Customer_Location_City = Table_Customer_Location.CreateObject(PdPDM.cls_Column)
    Column_Customer_Location_City.Name = "City"
    Column_Customer_Location_City.DisplayName = "City"
    Column_Customer_Location_City.Code = "Column_Customer_Location_City"
    Column_Customer_Location_City.Domain = Domain_City
    Column_Customer_Location_City.Mandatory = True
    Column_Customer_Location_City.Comment = _
        "City"
set PK_Table_Customer_Location = Table_Customer_Location.Keys.CreateNew()
    PK_Table_Customer_Location.Name = "PK Customer_Location"
    PK_Table_Customer_Location.Primary = True
    PK_Table_Customer_Location.Columns.Add( Column_Customer_Location_Customer)
    PK_Table_Customer_Location.Columns.Add( Column_Customer_Location_City)
Set PI_Customer_Location = Table_Customer_Location.Indexes.CreateNew()
    PI_Customer_Location.Name = "PI_Customer_Location"
    PI_Customer_Location.LinkedObject = PK_Table_Customer_Location

' Create table Division

Set Table_Division = PDM.CreateObject(PdPDM.cls_table)
    Table_Division.Name = "Division"
    Table_Division.DisplayName = "Division"
    Table_Division.Code = "Table_Division"
    Table_Division.Comment = _
        "Division <division nr> has name <Name of Division>." & vbCrLf & _
        "-------------------" & vbCrLf & _
        "Example Population:" & vbCrLf & _
        "-------------------" & vbCrLf & _
        "division_nr;Name_of_Division" & vbCrLf & _
        "6;'Soil Research'"
Set Column_Division_division_nr = Table_Division.CreateObject(PdPDM.cls_Column)
    Column_Division_division_nr.Name = "division_nr"
    Column_Division_division_nr.DisplayName = "division_nr"
    Column_Division_division_nr.Code = "Column_Division_division_nr"
    Column_Division_division_nr.Domain = Domain_division_nr
    Column_Division_division_nr.Mandatory = True
    Column_Division_division_nr.Comment = _
        "division nr"
Set Column_Division_Name_of_Division = Table_Division.CreateObject(PdPDM.cls_Column)
    Column_Division_Name_of_Division.Name = "Name_of_Division"
    Column_Division_Name_of_Division.DisplayName = "Name_of_Division"
    Column_Division_Name_of_Division.Code = "Column_Division_Name_of_Division"
    Column_Division_Name_of_Division.Domain = Domain_division_name
    Column_Division_Name_of_Division.Mandatory = True
    Column_Division_Name_of_Division.Comment = _
        "Name of Division"
set PK_Table_Division = Table_Division.Keys.CreateNew()
    PK_Table_Division.Name = "PK Division"
    PK_Table_Division.Primary = True
    PK_Table_Division.Columns.Add( Column_Division_division_nr)
Set AK1_Division = Table_Division.Keys.CreateNew()
    AK1_Division.Primary = false
    AK1_Division.Name = "AK1 Division"
    AK1_Division.Columns.Add( Column_Division_Name_of_Division )
Set PI_Division = Table_Division.Indexes.CreateNew()
    PI_Division.Name = "PI_Division"
    PI_Division.LinkedObject = PK_Table_Division
Set AI1_Division = Table_Division.Indexes.CreateNew()
    AI1_Division.Name = "AI1_Division"
Set AI1_Division_C1 = AI1_Division.IndexColumns.CreateNew()
    AI1_Division_C1.Column = Column_Division_Name_of_Division

' Create table Employee

Set Table_Employee = PDM.CreateObject(PdPDM.cls_table)
    Table_Employee.Name = "Employee"
    Table_Employee.DisplayName = "Employee"
    Table_Employee.Code = "Table_Employee"
    Table_Employee.Comment = _
        "Employee <employee no> has name <Employee Name>." & vbCrLf & _
        "Employee <employee no> has title <Title>." & vbCrLf & _
        "Employee <employee no> is arranged to division <Division>." & vbCrLf & _
        "-------------------" & vbCrLf & _
        "Example Population:" & vbCrLf & _
        "-------------------" & vbCrLf & _
        "employee_no;Employee_Name;Title;Division" & vbCrLf & _
        "618;'Boven W.J. van';'ing';6"
Set Column_Employee_employee_no = Table_Employee.CreateObject(PdPDM.cls_Column)
    Column_Employee_employee_no.Name = "employee_no"
    Column_Employee_employee_no.DisplayName = "employee_no"
    Column_Employee_employee_no.Code = "Column_Employee_employee_no"
    Column_Employee_employee_no.Domain = Domain_employee_no
    Column_Employee_employee_no.Mandatory = True
    Column_Employee_employee_no.Comment = _
        "employee no"
Set Column_Employee_Employee_Name = Table_Employee.CreateObject(PdPDM.cls_Column)
    Column_Employee_Employee_Name.Name = "Employee_Name"
    Column_Employee_Employee_Name.DisplayName = "Employee_Name"
    Column_Employee_Employee_Name.Code = "Column_Employee_Employee_Name"
    Column_Employee_Employee_Name.Domain = Domain_person_name
    Column_Employee_Employee_Name.Mandatory = True
    Column_Employee_Employee_Name.Comment = _
        "Employee Name"
Set Column_Employee_Title = Table_Employee.CreateObject(PdPDM.cls_Column)
    Column_Employee_Title.Name = "Title"
    Column_Employee_Title.DisplayName = "Title"
    Column_Employee_Title.Code = "Column_Employee_Title"
    Column_Employee_Title.Domain = Domain_title_code
    Column_Employee_Title.Comment = _
        "Employee Title\Title"
Set Column_Employee_Division = Table_Employee.CreateObject(PdPDM.cls_Column)
    Column_Employee_Division.Name = "Division"
    Column_Employee_Division.DisplayName = "Division"
    Column_Employee_Division.Code = "Column_Employee_Division"
    Column_Employee_Division.Domain = Domain_division_nr
    Column_Employee_Division.Mandatory = True
    Column_Employee_Division.Comment = _
        "Division Employee\Division"
set PK_Table_Employee = Table_Employee.Keys.CreateNew()
    PK_Table_Employee.Name = "PK Employee"
    PK_Table_Employee.Primary = True
    PK_Table_Employee.Columns.Add( Column_Employee_employee_no)
Set PI_Employee = Table_Employee.Indexes.CreateNew()
    PI_Employee.Name = "PI_Employee"
    PI_Employee.LinkedObject = PK_Table_Employee

' Create table Hour_Rate

Set Table_Hour_Rate = PDM.CreateObject(PdPDM.cls_table)
    Table_Hour_Rate.Name = "Hour_Rate"
    Table_Hour_Rate.DisplayName = "Hour_Rate"
    Table_Hour_Rate.Code = "Table_Hour_Rate"
    Table_Hour_Rate.Comment = _
        "From week <Year><week no> the hour rate for employee <Employee> working on project <Project> is EUR <Amount>." & vbCrLf & _
        "-------------------" & vbCrLf & _
        "Example Population:" & vbCrLf & _
        "-------------------" & vbCrLf & _
        "Year;week_no;Employee;Project;Amount" & vbCrLf & _
        "2001;09;618;'6323.16';213,83" & vbCrLf & _
        "2001;38;312;'7004.07';164,00"
Set Column_Hour_Rate_Year = Table_Hour_Rate.CreateObject(PdPDM.cls_Column)
    Column_Hour_Rate_Year.Name = "Year"
    Column_Hour_Rate_Year.DisplayName = "Year"
    Column_Hour_Rate_Year.Code = "Column_Hour_Rate_Year"
    Column_Hour_Rate_Year.Domain = Domain_year_no
    Column_Hour_Rate_Year.Mandatory = True
    Column_Hour_Rate_Year.Comment = _
        "Week\Year"
Set Column_Hour_Rate_week_no = Table_Hour_Rate.CreateObject(PdPDM.cls_Column)
    Column_Hour_Rate_week_no.Name = "week_no"
    Column_Hour_Rate_week_no.DisplayName = "week_no"
    Column_Hour_Rate_week_no.Code = "Column_Hour_Rate_week_no"
    Column_Hour_Rate_week_no.Domain = Domain_week_no
    Column_Hour_Rate_week_no.Mandatory = True
    Column_Hour_Rate_week_no.Comment = _
        "Week\week no"
Set Column_Hour_Rate_Employee = Table_Hour_Rate.CreateObject(PdPDM.cls_Column)
    Column_Hour_Rate_Employee.Name = "Employee"
    Column_Hour_Rate_Employee.DisplayName = "Employee"
    Column_Hour_Rate_Employee.Code = "Column_Hour_Rate_Employee"
    Column_Hour_Rate_Employee.Domain = Domain_employee_no
    Column_Hour_Rate_Employee.Mandatory = True
    Column_Hour_Rate_Employee.Comment = _
        "Project Employee\Employee"
Set Column_Hour_Rate_Project = Table_Hour_Rate.CreateObject(PdPDM.cls_Column)
    Column_Hour_Rate_Project.Name = "Project"
    Column_Hour_Rate_Project.DisplayName = "Project"
    Column_Hour_Rate_Project.Code = "Column_Hour_Rate_Project"
    Column_Hour_Rate_Project.Domain = Domain_project_no
    Column_Hour_Rate_Project.Mandatory = True
    Column_Hour_Rate_Project.Comment = _
        "Project Employee\Project"
Set Column_Hour_Rate_Amount = Table_Hour_Rate.CreateObject(PdPDM.cls_Column)
    Column_Hour_Rate_Amount.Name = "Amount"
    Column_Hour_Rate_Amount.DisplayName = "Amount"
    Column_Hour_Rate_Amount.Code = "Column_Hour_Rate_Amount"
    Column_Hour_Rate_Amount.Domain = Domain_amount_of_euros
    Column_Hour_Rate_Amount.Mandatory = True
    Column_Hour_Rate_Amount.Comment = _
        "Amount"
set PK_Table_Hour_Rate = Table_Hour_Rate.Keys.CreateNew()
    PK_Table_Hour_Rate.Name = "PK Hour_Rate"
    PK_Table_Hour_Rate.Primary = True
    PK_Table_Hour_Rate.Columns.Add( Column_Hour_Rate_Year)
    PK_Table_Hour_Rate.Columns.Add( Column_Hour_Rate_week_no)
    PK_Table_Hour_Rate.Columns.Add( Column_Hour_Rate_Employee)
    PK_Table_Hour_Rate.Columns.Add( Column_Hour_Rate_Project)
Set PI_Hour_Rate = Table_Hour_Rate.Indexes.CreateNew()
    PI_Hour_Rate.Name = "PI_Hour_Rate"
    PI_Hour_Rate.LinkedObject = PK_Table_Hour_Rate

' Create table Project

Set Table_Project = PDM.CreateObject(PdPDM.cls_table)
    Table_Project.Name = "Project"
    Table_Project.DisplayName = "Project"
    Table_Project.Code = "Table_Project"
    Table_Project.Comment = _
        "Project <project no> is the responsibility of division <Division>." & vbCrLf & _
        "Project <project no> is managed by employee <Employee>." & vbCrLf & _
        "Project <project no> is carried out for customer <Customer>." & vbCrLf & _
        "Project <project no> has description <Project Description>." & vbCrLf & _
        "-------------------" & vbCrLf & _
        "Example Population:" & vbCrLf & _
        "-------------------" & vbCrLf & _
        "project_no;Division;Employee;Customer;Project_Description" & vbCrLf & _
        "'6323.16';6;283;4081;'Investigation of ...dumping site in Ulbach'"
Set Column_Project_project_no = Table_Project.CreateObject(PdPDM.cls_Column)
    Column_Project_project_no.Name = "project_no"
    Column_Project_project_no.DisplayName = "project_no"
    Column_Project_project_no.Code = "Column_Project_project_no"
    Column_Project_project_no.Domain = Domain_project_no
    Column_Project_project_no.Mandatory = True
    Column_Project_project_no.Comment = _
        "project no"
Set Column_Project_Division = Table_Project.CreateObject(PdPDM.cls_Column)
    Column_Project_Division.Name = "Division"
    Column_Project_Division.DisplayName = "Division"
    Column_Project_Division.Code = "Column_Project_Division"
    Column_Project_Division.Domain = Domain_division_nr
    Column_Project_Division.Mandatory = True
    Column_Project_Division.Comment = _
        "Responsible Division\Division"
Set Column_Project_Employee = Table_Project.CreateObject(PdPDM.cls_Column)
    Column_Project_Employee.Name = "Employee"
    Column_Project_Employee.DisplayName = "Employee"
    Column_Project_Employee.Code = "Column_Project_Employee"
    Column_Project_Employee.Domain = Domain_employee_no
    Column_Project_Employee.Comment = _
        "Project Manager\Employee"
Set Column_Project_Customer = Table_Project.CreateObject(PdPDM.cls_Column)
    Column_Project_Customer.Name = "Customer"
    Column_Project_Customer.DisplayName = "Customer"
    Column_Project_Customer.Code = "Column_Project_Customer"
    Column_Project_Customer.Domain = Domain_customernumber
    Column_Project_Customer.Mandatory = True
    Column_Project_Customer.Comment = _
        "Customer Project\Customer" & vbCrLf & _
        "pipo"
Set Column_Project_Project_Description = Table_Project.CreateObject(PdPDM.cls_Column)
    Column_Project_Project_Description.Name = "Project_Description"
    Column_Project_Project_Description.DisplayName = "Project_Description"
    Column_Project_Project_Description.Code = "Column_Project_Project_Description"
    Column_Project_Project_Description.Domain = Domain_description
    Column_Project_Project_Description.Mandatory = True
    Column_Project_Project_Description.Comment = _
        "Project Description" & vbCrLf & _
        "de clown"
set PK_Table_Project = Table_Project.Keys.CreateNew()
    PK_Table_Project.Name = "PK Project"
    PK_Table_Project.Primary = True
    PK_Table_Project.Columns.Add( Column_Project_project_no)
Set PI_Project = Table_Project.Indexes.CreateNew()
    PI_Project.Name = "PI_Project"
    PI_Project.LinkedObject = PK_Table_Project

' Create table Work_Task

Set Table_Work_Task = PDM.CreateObject(PdPDM.cls_table)
    Table_Work_Task.Name = "Work_Task"
    Table_Work_Task.DisplayName = "Work_Task"
    Table_Work_Task.Code = "Table_Work_Task"
    Table_Work_Task.Comment = _
        "There is a Work Task with wbs code <wbs number>." & vbCrLf & _
        "Work task <wbs number> has name <Work Task Name>." & vbCrLf & _
        "-------------------" & vbCrLf & _
        "Example Population:" & vbCrLf & _
        "-------------------" & vbCrLf & _
        "wbs_number;Work_Task_Name" & vbCrLf & _
        "1;'preparation'" & vbCrLf & _
        "14;'drawing'"
Set Column_Work_Task_wbs_number = Table_Work_Task.CreateObject(PdPDM.cls_Column)
    Column_Work_Task_wbs_number.Name = "wbs_number"
    Column_Work_Task_wbs_number.DisplayName = "wbs_number"
    Column_Work_Task_wbs_number.Code = "Column_Work_Task_wbs_number"
    Column_Work_Task_wbs_number.Domain = Domain_wbs_number
    Column_Work_Task_wbs_number.Mandatory = True
    Column_Work_Task_wbs_number.Comment = _
        "wbs number"
Set Column_Work_Task_Work_Task_Name = Table_Work_Task.CreateObject(PdPDM.cls_Column)
    Column_Work_Task_Work_Task_Name.Name = "Work_Task_Name"
    Column_Work_Task_Work_Task_Name.DisplayName = "Work_Task_Name"
    Column_Work_Task_Work_Task_Name.Code = "Column_Work_Task_Work_Task_Name"
    Column_Work_Task_Work_Task_Name.Domain = Domain_task_name
    Column_Work_Task_Work_Task_Name.Mandatory = True
    Column_Work_Task_Work_Task_Name.Comment = _
        "Work Task Name"
set PK_Table_Work_Task = Table_Work_Task.Keys.CreateNew()
    PK_Table_Work_Task.Name = "PK Work_Task"
    PK_Table_Work_Task.Primary = True
    PK_Table_Work_Task.Columns.Add( Column_Work_Task_wbs_number)
Set AK1_Work_Task = Table_Work_Task.Keys.CreateNew()
    AK1_Work_Task.Primary = false
    AK1_Work_Task.Name = "AK1 Work_Task"
    AK1_Work_Task.Columns.Add( Column_Work_Task_Work_Task_Name )
Set PI_Work_Task = Table_Work_Task.Indexes.CreateNew()
    PI_Work_Task.Name = "PI_Work_Task"
    PI_Work_Task.LinkedObject = PK_Table_Work_Task
Set AI1_Work_Task = Table_Work_Task.Indexes.CreateNew()
    AI1_Work_Task.Name = "AI1_Work_Task"
Set AI1_Work_Task_C1 = AI1_Work_Task.IndexColumns.CreateNew()
    AI1_Work_Task_C1.Column = Column_Work_Task_Work_Task_Name

' Create table Working_Hours

Set Table_Working_Hours = PDM.CreateObject(PdPDM.cls_table)
    Table_Working_Hours.Name = "Working_Hours"
    Table_Working_Hours.DisplayName = "Working_Hours"
    Table_Working_Hours.Code = "Table_Working_Hours"
    Table_Working_Hours.Comment = _
        "In week <Year><week no> employee <Employee> working on project <Project> <amount of hours> hours at work task <Work Task> ." & vbCrLf & _
        "-------------------" & vbCrLf & _
        "Example Population:" & vbCrLf & _
        "-------------------" & vbCrLf & _
        "Year;week_no;Employee;Project;Work_Task;amount_of_hours" & vbCrLf & _
        "2001;38;618;'7004.07';1;2" & vbCrLf & _
        "2001;38;232;'6323.16';14;4"
Set Column_Working_Hours_Year = Table_Working_Hours.CreateObject(PdPDM.cls_Column)
    Column_Working_Hours_Year.Name = "Year"
    Column_Working_Hours_Year.DisplayName = "Year"
    Column_Working_Hours_Year.Code = "Column_Working_Hours_Year"
    Column_Working_Hours_Year.Domain = Domain_year_no
    Column_Working_Hours_Year.Mandatory = True
    Column_Working_Hours_Year.Comment = _
        "Week\Year"
Set Column_Working_Hours_week_no = Table_Working_Hours.CreateObject(PdPDM.cls_Column)
    Column_Working_Hours_week_no.Name = "week_no"
    Column_Working_Hours_week_no.DisplayName = "week_no"
    Column_Working_Hours_week_no.Code = "Column_Working_Hours_week_no"
    Column_Working_Hours_week_no.Domain = Domain_week_no
    Column_Working_Hours_week_no.Mandatory = True
    Column_Working_Hours_week_no.Comment = _
        "Week\week no"
Set Column_Working_Hours_Employee = Table_Working_Hours.CreateObject(PdPDM.cls_Column)
    Column_Working_Hours_Employee.Name = "Employee"
    Column_Working_Hours_Employee.DisplayName = "Employee"
    Column_Working_Hours_Employee.Code = "Column_Working_Hours_Employee"
    Column_Working_Hours_Employee.Domain = Domain_employee_no
    Column_Working_Hours_Employee.Mandatory = True
    Column_Working_Hours_Employee.Comment = _
        "Project Employee\Employee"
Set Column_Working_Hours_Project = Table_Working_Hours.CreateObject(PdPDM.cls_Column)
    Column_Working_Hours_Project.Name = "Project"
    Column_Working_Hours_Project.DisplayName = "Project"
    Column_Working_Hours_Project.Code = "Column_Working_Hours_Project"
    Column_Working_Hours_Project.Domain = Domain_project_no
    Column_Working_Hours_Project.Mandatory = True
    Column_Working_Hours_Project.Comment = _
        "Project Employee\Project"
Set Column_Working_Hours_Work_Task = Table_Working_Hours.CreateObject(PdPDM.cls_Column)
    Column_Working_Hours_Work_Task.Name = "Work_Task"
    Column_Working_Hours_Work_Task.DisplayName = "Work_Task"
    Column_Working_Hours_Work_Task.Code = "Column_Working_Hours_Work_Task"
    Column_Working_Hours_Work_Task.Domain = Domain_wbs_number
    Column_Working_Hours_Work_Task.Mandatory = True
    Column_Working_Hours_Work_Task.Comment = _
        "Work Task"
Set Column_Working_Hours_amount_of_hours = Table_Working_Hours.CreateObject(PdPDM.cls_Column)
    Column_Working_Hours_amount_of_hours.Name = "amount_of_hours"
    Column_Working_Hours_amount_of_hours.DisplayName = "amount_of_hours"
    Column_Working_Hours_amount_of_hours.Code = "Column_Working_Hours_amount_of_hours"
    Column_Working_Hours_amount_of_hours.Domain = Domain_amount_of_hours
    Column_Working_Hours_amount_of_hours.Mandatory = True
    Column_Working_Hours_amount_of_hours.Comment = _
        "amount of hours"
set PK_Table_Working_Hours = Table_Working_Hours.Keys.CreateNew()
    PK_Table_Working_Hours.Name = "PK Working_Hours"
    PK_Table_Working_Hours.Primary = True
    PK_Table_Working_Hours.Columns.Add( Column_Working_Hours_Year)
    PK_Table_Working_Hours.Columns.Add( Column_Working_Hours_week_no)
    PK_Table_Working_Hours.Columns.Add( Column_Working_Hours_Employee)
    PK_Table_Working_Hours.Columns.Add( Column_Working_Hours_Project)
    PK_Table_Working_Hours.Columns.Add( Column_Working_Hours_Work_Task)
Set AK1_Working_Hours = Table_Working_Hours.Keys.CreateNew()
    AK1_Working_Hours.Primary = false
    AK1_Working_Hours.Name = "AK1 Working_Hours"
    AK1_Working_Hours.Columns.Add( Column_Working_Hours_Year )
    AK1_Working_Hours.Columns.Add( Column_Working_Hours_week_no )
    AK1_Working_Hours.Columns.Add( Column_Working_Hours_Employee )
    AK1_Working_Hours.Columns.Add( Column_Working_Hours_Project )
    AK1_Working_Hours.Columns.Add( Column_Working_Hours_amount_of_hours )
Set AI1_Working_Hours = Table_Working_Hours.Indexes.CreateNew()
    AI1_Working_Hours.Name = "AI1_Working_Hours"
Set AI1_Working_Hours_C1 = AI1_Working_Hours.IndexColumns.CreateNew()
    AI1_Working_Hours_C1.Column = Column_Working_Hours_Year
Set AI1_Working_Hours_C2 = AI1_Working_Hours.IndexColumns.CreateNew()
    AI1_Working_Hours_C2.Column = Column_Working_Hours_week_no
Set AI1_Working_Hours_C3 = AI1_Working_Hours.IndexColumns.CreateNew()
    AI1_Working_Hours_C3.Column = Column_Working_Hours_Employee
Set AI1_Working_Hours_C4 = AI1_Working_Hours.IndexColumns.CreateNew()
    AI1_Working_Hours_C4.Column = Column_Working_Hours_Project
Set AI1_Working_Hours_C5 = AI1_Working_Hours.IndexColumns.CreateNew()
    AI1_Working_Hours_C5.Column = Column_Working_Hours_amount_of_hours
Set PI_Working_Hours = Table_Working_Hours.Indexes.CreateNew()
    PI_Working_Hours.Name = "PI_Working_Hours"
    PI_Working_Hours.LinkedObject = PK_Table_Working_Hours

' Creating Relationships

Set FK1_Working_Hours = PDM.CreateObject(PdPDM.cls_reference)
    FK1_Working_Hours.Name = "Working_Hours_Work_Task"
    FK1_Working_Hours.Code = "FK1_Working_Hours"
    FK1_Working_Hours.ForeignKeyConstraintName = "FK1_Working_Hours_Work_Task"
    FK1_Working_Hours.ChildTable = Table_Working_Hours
    FK1_Working_Hours.ParentTable = Table_Work_Task
    FK1_Working_Hours.MinimumCardinality = "1"
    FK1_Working_Hours.MaximumCardinality = "*"
    FK1_Working_Hours.Joins.Item(0).Object1 = Column_Working_Hours_Work_Task

Set FK2_Project = PDM.CreateObject(PdPDM.cls_reference)
    FK2_Project.Name = "Project_Division"
    FK2_Project.Code = "FK2_Project"
    FK2_Project.ForeignKeyConstraintName = "FK2_Project_Responsbl_Dvsn_Dvsn"
    FK2_Project.ChildTable = Table_Project
    FK2_Project.ParentTable = Table_Division
    FK2_Project.MinimumCardinality = "1"
    FK2_Project.MaximumCardinality = "*"
    FK2_Project.Joins.Item(0).Object1 = Column_Project_Division

Set FK3_Project = PDM.CreateObject(PdPDM.cls_reference)
    FK3_Project.Name = "Project_Employee"
    FK3_Project.Code = "FK3_Project"
    FK3_Project.ForeignKeyConstraintName = "FK3_Project_Project_Mangr_Emply"
    FK3_Project.ChildTable = Table_Project
    FK3_Project.ParentTable = Table_Employee
    FK3_Project.MinimumCardinality = "0"
    FK3_Project.MaximumCardinality = "*"
    FK3_Project.Joins.Item(0).Object1 = Column_Project_Employee

Set FK4_Project = PDM.CreateObject(PdPDM.cls_reference)
    FK4_Project.Name = "Project_Customer"
    FK4_Project.Code = "FK4_Project"
    FK4_Project.ForeignKeyConstraintName = "FK4_Project_Customr_Prjct_Cstmr"
    FK4_Project.ChildTable = Table_Project
    FK4_Project.ParentTable = Table_Customer
    FK4_Project.MinimumCardinality = "1"
    FK4_Project.MaximumCardinality = "*"
    FK4_Project.Joins.Item(0).Object1 = Column_Project_Customer

Set FK5_Employee = PDM.CreateObject(PdPDM.cls_reference)
    FK5_Employee.Name = "Employee_Division"
    FK5_Employee.Code = "FK5_Employee"
    FK5_Employee.ForeignKeyConstraintName = "FK5_Employee_Divisin_Emply_Dvsn"
    FK5_Employee.ChildTable = Table_Employee
    FK5_Employee.ParentTable = Table_Division
    FK5_Employee.MinimumCardinality = "1"
    FK5_Employee.MaximumCardinality = "*"
    FK5_Employee.Joins.Item(0).Object1 = Column_Employee_Division

Set FK6_Customer_Location = PDM.CreateObject(PdPDM.cls_reference)
    FK6_Customer_Location.Name = "Customer_Location_Customer"
    FK6_Customer_Location.Code = "FK6_Customer_Location"
    FK6_Customer_Location.ForeignKeyConstraintName = "FK6_Customer_Location_Customer"
    FK6_Customer_Location.ChildTable = Table_Customer_Location
    FK6_Customer_Location.ParentTable = Table_Customer
    FK6_Customer_Location.MinimumCardinality = "1"
    FK6_Customer_Location.MaximumCardinality = "*"
    FK6_Customer_Location.Joins.Item(0).Object1 = Column_Customer_Location_Customer

Set FK7_Working_Hours = PDM.CreateObject(PdPDM.cls_reference)
    FK7_Working_Hours.Name = "Working_Hours_Employee"
    FK7_Working_Hours.Code = "FK7_Working_Hours"
    FK7_Working_Hours.ForeignKeyConstraintName = "FK7_Wrkng_Hrs_Prjct_Emply_Emply"
    FK7_Working_Hours.ChildTable = Table_Working_Hours
    FK7_Working_Hours.ParentTable = Table_Employee
    FK7_Working_Hours.MinimumCardinality = "1"
    FK7_Working_Hours.MaximumCardinality = "*"
    FK7_Working_Hours.Joins.Item(0).Object1 = Column_Working_Hours_Employee

' Unsupported subset constraint on subtype
' FK8_Working_Hours
' From "Working_Hours" to "Hour_Rate"

Set FK9_Working_Hours = PDM.CreateObject(PdPDM.cls_reference)
    FK9_Working_Hours.Name = "Working_Hours_Project"
    FK9_Working_Hours.Code = "FK9_Working_Hours"
    FK9_Working_Hours.ForeignKeyConstraintName = "FK9_Wrkng_Hrs_Prjct_Emply_Prjct"
    FK9_Working_Hours.ChildTable = Table_Working_Hours
    FK9_Working_Hours.ParentTable = Table_Project
    FK9_Working_Hours.MinimumCardinality = "1"
    FK9_Working_Hours.MaximumCardinality = "*"
    FK9_Working_Hours.Joins.Item(0).Object1 = Column_Working_Hours_Project

Set FK10_Hour_Rate = PDM.CreateObject(PdPDM.cls_reference)
    FK10_Hour_Rate.Name = "Hour_Rate_Employee"
    FK10_Hour_Rate.Code = "FK10_Hour_Rate"
    FK10_Hour_Rate.ForeignKeyConstraintName = "FK10_Hour_Rat_Prjct_Emply_Emply"
    FK10_Hour_Rate.ChildTable = Table_Hour_Rate
    FK10_Hour_Rate.ParentTable = Table_Employee
    FK10_Hour_Rate.MinimumCardinality = "1"
    FK10_Hour_Rate.MaximumCardinality = "*"
    FK10_Hour_Rate.Joins.Item(0).Object1 = Column_Hour_Rate_Employee

Set FK11_Hour_Rate = PDM.CreateObject(PdPDM.cls_reference)
    FK11_Hour_Rate.Name = "Hour_Rate_Project"
    FK11_Hour_Rate.Code = "FK11_Hour_Rate"
    FK11_Hour_Rate.ForeignKeyConstraintName = "FK11_Hour_Rat_Prjct_Emply_Prjct"
    FK11_Hour_Rate.ChildTable = Table_Hour_Rate
    FK11_Hour_Rate.ParentTable = Table_Project
    FK11_Hour_Rate.MinimumCardinality = "1"
    FK11_Hour_Rate.MaximumCardinality = "*"
    FK11_Hour_Rate.Joins.Item(0).Object1 = Column_Hour_Rate_Project

' Create Inheritances

if createInheritance then
'else
'    Table_Hour_Rate.ParentEntity = Table_Project
end if


' DATABASE VIEWS
if PdMajorVersion >= 9 then

' VIEW Project Employee
Set View = PDM.Views.CreateNew
    View.Name = "Project Employee"
    View.Code = "V_Project_Employee"
    Sql = "SELECT DISTINCT "
Set ViewCol = View.Columns.CreateNew
    ViewCol.Name = "Employee"
    Sql = Sql + vbCrLf + "  " + Column_Hour_Rate_Employee.code + " as Employee,"
Set ViewCol = View.Columns.CreateNew
    ViewCol.Name = "Project"
    Sql = Sql + vbCrLf + "  " + Column_Hour_Rate_Project.code + " as Employee,"
    Sql = Sql + vbCrLf + "FROM Table_Hour_Rate Hour_Rate"
    View.SQLQuery = Sql

' VIEW Week
Set View = PDM.Views.CreateNew
    View.Name = "Week"
    View.Code = "V_Week"
    Sql = "SELECT DISTINCT "
Set ViewCol = View.Columns.CreateNew
    ViewCol.Name = "Year"
    Sql = Sql + vbCrLf + "  " + Column_Hour_Rate_Year.code + " as Year,"
Set ViewCol = View.Columns.CreateNew
    ViewCol.Name = "week_no"
    Sql = Sql + vbCrLf + "  " + Column_Hour_Rate_week_no.code + " as Year,"
    Sql = Sql + vbCrLf + "FROM Table_Hour_Rate Hour_Rate"
    View.SQLQuery = Sql

end if ' end of view definitions for powerdesigner 9+

' Create Diagram and Add Symbols
Dim PDD
    if PDM.PhysicalDiagrams.count = 1 then
      Set PDD = PDM.PhysicalDiagrams.Item(0) 
    end if
    if PDD is nothing then
      Set PDD = PDM.CreateObject(PdPDM.cls_PhysicalDiagram)
    end if
    PDD.Name = "Full Diagram"
    PDD.SetAsDefault = true
    PDD.AttachAllObjects
    PDD.AutoLayout()
    PDD.OpenView()

' Detail SearchObject function that allows you to browse a collection from its name and the searched object
' * SUB   SearchObject
Function SearchObject (Coll, Name)
'For example Coll = Categories and Name = Settings
  Dim Found, Object
   For Each Object in Coll
      If Object.Name = Name Then
         Set Found = Object
      End If
   Next
   Set SearchObject = Found
End Function

' DefineAttribute function
Function DefineAttribute (anExt, aMetaClass, aCategory, aName, aDataType)
  'Drill down the collection tree using the searchObject function
  ' Find or create the category
  Dim C
  Set C = SearchObject (anExt.Categories, aCategory)
  if C is Nothing then
    set C = anExt.Categories.CreateNew(cls_TargetCategory)
    C.Name = aCategory
  end if
  ' Find or create the attribute
  Dim A
  A = SearchObject (C, aName)
  if A is Nothing then
    A = C.Categories.CreateNew(cls_ExtendedAttributeTargetItem)
    A.DataType = aDataType
    A.Value = aDataType
    A.Name = aName
  end if
End Function

' Set extended attribute value of an object
Function SetAttributeValue (aModel, anObject, aCategory, aName, aValue)
  'Drill down the collection tree using the searchObject function
  ' Find or create the category
  Dim C
  Set C = SearchObject (aModel.Categories, "Entities")
  Set C = SearchObject (C, aCategory)
  C.SetExtendedAttribute aName, aValue
End Function

msgbox "Finished creating both CDM/PDM models"
