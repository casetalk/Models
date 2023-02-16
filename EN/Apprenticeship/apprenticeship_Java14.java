package apprenticeship;

// Project    apprenticeship.prj
// Path    \\mac\home\documents\CaseTalk\GitHub\Models\EN\apprenticeship\
// Description    
// Repository    \\mac\home\documents\CaseTalk\GitHub\Models\EN\apprenticeship\apprenticeship.ig
// Author    marcow


/*
 * [Rules]
 * "<$crud> is identified by <$crud ID>."
 */
  public record X_crud(
    X_crud_ID X_crud_ID,
    Username X_crud_Created_By,
    Username X_crud_Updated_By,
    Timestamp X_crud_Created_On,
    Timestamp X_crud_Updated_On
  ) {}


/*
 * [Comment]
 * [Definition]-- connection: SomeDbNameHereselect columnn as labeltypenamefrom tableorder by column[Reference Data]-- connection: SomeDbNameHereselect columnn as labeltypenamefrom tableorder by column
 * [Rules]
 * "Is concept type Location"
 * "<Address> is unique on <street and number> and <City> and <Provence> and <Country>."
 * "<Address> must occur in <Student>."
 */
  public record Address(
    street_and_number street_and_number,
    City City,
    Provence Provence,
    Country Country
  ) {}


/*
 * [Comment]
 * a position as an apprentice : an arrangement in which someone learns an art, trade, or job under another.
 * [Rules]
 * "Is concept type Thing"
 * "<Apprenticeship> is identified by <apprenticeship_code>."
 * "<City> must occur in <City Of Residence> and/or <Apprenticeship>."
 */
  public record Apprenticeship(
    apprenticeship_code apprenticeship_code,
    description Apprenticeship_Description,
    City Apprenticeship_City,
    Month_Amount Apprenticeship_Duration,
    Category_Title Apprenticeship_Category
  ) {}


/*
 * [Comment]
 * [Reference Data]-- connection: SomeDbNameHereselect columnn as labeltypenamefrom tableorder by column
 * [Rules]
 * "Is concept type Aggregation"
 * "<Apprenticeship Assigned> is unique on <Apprenticeship>."
 * "<Student> in <Apprenticeship Assigned> may occur max 2 times."
 */
  public record Apprenticeship_Assigned(
    Student Student,
    Apprenticeship Apprenticeship
  ) {}


/*
 * [Comment]
 * one that is preferred
 * [Definition]
 * -- connection: SomeDbNameHereselect columnn as labeltypenamefrom tableorder by column
 * [Reference Data]
 * -- connection: SomeDbNameHereselect columnn as labeltypenamefrom tableorder by column
 * [Rules]
 * "<Apprenticeship Preference> is unique on <Student> and <number>."
 * "<Apprenticeship Preference> is unique on <Student> and <Apprenticeship>."
 * "<Student> in <Apprenticeship Preference> must occur 3 times."
 */
/*
 * Owner
 *   Date : 08/02/2023 08:59:36
 * Source
 *   Date : 08/02/2023 08:59:36
 */
  public record Apprenticeship_Preference(
    Student Student,
    number number,
    Apprenticeship Apprenticeship
  ) {}


/*
 * [Rules]
 * "Is concept type Location"
 * "<City> is identified by <city_name>."
 * "<City> must occur in <City Of Residence> and/or <Apprenticeship>."
 */
  public record City(
    city_name city_name,
    X_citizens Population
  ) {}


/*
 * [Rules]
 * "Population supports Valid & Transaction Time"
 * "<City Of Residence> is unique on <Student> and <City>."
 * "<City> must occur in <City Of Residence> and/or <Apprenticeship>."
 * "<City Of Residence> inhabits <Student>."
 */
  public record City_Of_Residence(
    Student Student,
    City City
  ) {}


/*
 * [Rules]
 * "<Employee> is unique on <Emp_no>."
 * "<Employee> must occur in <Person>."
 */
  public record Employee(
    Emp_no Emp_no
  ) {}


/*
 * [Comment]
 * [Reference Data]-- connection: SomeDbNameHereselect columnn as labeltypenamefrom tableorder by column
 * [Rules]
 * "Is concept type Person"
 * "<Graduate>is a subtype of <Student> and <date>."
 */
  public record Graduate(
    Student Student,
    date Graduation_Date
  ) {}


/*
 * [Rules]
 * "<Person> is unique on <Student> and <Employee>."
 */
  public record Person(
    Day Birthday,
    Student Student,
    Employee Employee
  ) {}


/*
 * [Rules]
 * "<street and number> is unique on <Street> and <house number>."
 * "<street and number> must occur in <Address>."
 */
  public record street_and_number(
    Street Street,
    house_number house_number
  ) {}


/*
 * [Comment]
 * [Definition]A person who attends a school, college, or university to follow theoretical classes and at least an apprenticeship.[Reference Data]-- connection: SomeDbNameHereselect columnn as labeltypenamefrom tableorder by column
 * [Rules]
 * "Is concept type Person"
 * "<Student> is identified by <firstname> and <lastname>."
 * "<Student> lives in <City Of Residence>."
 */
  public record Student(
    firstname firstname,
    lastname lastname,
    Address Student_Mail_Address,
    Student Student_Buddy_Buddy,
    Type Student_Type
  ) {}

