unit apprenticeship;

// Project    apprenticeship.prj
// Path    \\Mac\Home\Documents\CaseTalk\Marketing\By Others\Han16juni2004\
// Description    
// Repository    \\Mac\Home\Documents\CaseTalk\Marketing\By Others\Han16juni2004\apprenticeship.ig
// Author    marcow

interface

uses Classes, MyTypes;

{
  [Rules]
  "<$crud> is identified by <$crud ID>."
}
  TX_crud = class(TCollectionItem)
  private
    { private declarations }
    FX_crud_ID: TX_crud_ID;
    FX_crud_Created_By: TUsername;
    FX_crud_Updated_By: TUsername;
    FX_crud_Created_On: TTimestamp;
    FX_crud_Updated_On: TTimestamp;
  protected
    { protected declarations }
    procedure SetX_crud_ID(aValue: TX_crud_ID);
    procedure SetX_crud_Created_By(aValue: TUsername);
    procedure SetX_crud_Updated_By(aValue: TUsername);
    procedure SetX_crud_Created_On(aValue: TTimestamp);
    procedure SetX_crud_Updated_On(aValue: TTimestamp);
  public
    { public declarations }
    procedure Assign(Source: TPersistent); override;
    function VerbalizedAsFacts: string;
  published
    { published declarations }
    property X_crud_ID: TX_crud_ID read FX_crud_ID write SetX_crud_ID;
    property X_crud_Created_By: TUsername read FX_crud_Created_By write SetX_crud_Created_By;
    property X_crud_Updated_By: TUsername read FX_crud_Updated_By write SetX_crud_Updated_By;
    property X_crud_Created_On: TTimestamp read FX_crud_Created_On write SetX_crud_Created_On;
    property X_crud_Updated_On: TTimestamp read FX_crud_Updated_On write SetX_crud_Updated_On;
  end;

  // Collection of X_crud
  TX_crudList = class(TCollection)
  protected
    function GetItems(index: integer): TX_crud;
    procedure SetItems(index: integer; value: TX_crud);
  protected
  public
    function IndexOf(aX_crud_ID: TX_crud_ID): integer;
    // ItemClass := TX_crud in the constructor..
    property Items[index: integer]: TX_crud read GetItems write SetItems;

  end;
);

{
  [Comment]
  [Definition]-- connection: SomeDbNameHereselect columnn as labeltypenamefrom tableorder by column[Reference Data]-- connection: SomeDbNameHereselect columnn as labeltypenamefrom tableorder by column
  [Rules]
  "Is concept type Location"
  "<Address> is unique on <street and number> and <City> and <Provence> and <Country>."
  "<Address> must occur in <Student>."
}
  TAddress = class(TCollectionItem)
  private
    { private declarations }
    Fstreet_and_number: Tstreet_and_number;
    FCity: TCity;
    FProvence: TProvence;
    FCountry: TCountry;
  protected
    { protected declarations }
    procedure Setstreet_and_number(aValue: Tstreet_and_number);
    procedure SetCity(aValue: TCity);
    procedure SetProvence(aValue: TProvence);
    procedure SetCountry(aValue: TCountry);
  public
    { public declarations }
    procedure Assign(Source: TPersistent); override;
    function VerbalizedAsFacts: string;
  published
    { published declarations }
    property street_and_number: Tstreet_and_number read Fstreet_and_number write Setstreet_and_number;
    property City: TCity read FCity write SetCity;
    property Provence: TProvence read FProvence write SetProvence;
    property Country: TCountry read FCountry write SetCountry;
  end;

  // Collection of Address
  TAddressList = class(TCollection)
  protected
    function GetItems(index: integer): TAddress;
    procedure SetItems(index: integer; value: TAddress);
  protected
  public
    function IndexOf(astreet_and_number: Tstreet_and_number; aCity: TCity; aProvence: TProvence; aCountry: TCountry): integer;
    // ItemClass := TAddress in the constructor..
    property Items[index: integer]: TAddress read GetItems write SetItems;

  end;
);

{
  [Comment]
  a position as an apprentice : an arrangement in which someone learns an art, trade, or job under another.
  [Rules]
  "Is concept type Thing"
  "<Apprenticeship> is identified by <apprenticeship_code>."
  "<City> must occur in <City Of Residence> and/or <Apprenticeship>."
}
  TApprenticeship = class(TCollectionItem)
  private
    { private declarations }
    Fapprenticeship_code: Tapprenticeship_code;
    FApprenticeship_Description: Tdescription;
    FApprenticeship_City: TCity;
    FApprenticeship_Duration: TMonth_Amount;
    FApprenticeship_Category: TCategory_Title;
  protected
    { protected declarations }
    procedure Setapprenticeship_code(aValue: Tapprenticeship_code);
    procedure SetApprenticeship_Description(aValue: Tdescription);
    procedure SetApprenticeship_City(aValue: TCity);
    procedure SetApprenticeship_Duration(aValue: TMonth_Amount);
    procedure SetApprenticeship_Category(aValue: TCategory_Title);
  public
    { public declarations }
    procedure Assign(Source: TPersistent); override;
    function VerbalizedAsFacts: string;
  published
    { published declarations }
    property apprenticeship_code: Tapprenticeship_code read Fapprenticeship_code write Setapprenticeship_code;
    property Apprenticeship_Description: Tdescription read FApprenticeship_Description write SetApprenticeship_Description;
    property Apprenticeship_City: TCity read FApprenticeship_City write SetApprenticeship_City;
    property Apprenticeship_Duration: TMonth_Amount read FApprenticeship_Duration write SetApprenticeship_Duration;
    property Apprenticeship_Category: TCategory_Title read FApprenticeship_Category write SetApprenticeship_Category;
  end;

  // Collection of Apprenticeship
  TApprenticeshipList = class(TCollection)
  protected
    function GetItems(index: integer): TApprenticeship;
    procedure SetItems(index: integer; value: TApprenticeship);
  protected
  public
    function IndexOf(aapprenticeship_code: Tapprenticeship_code): integer;
    // ItemClass := TApprenticeship in the constructor..
    property Items[index: integer]: TApprenticeship read GetItems write SetItems;

  end;
);

{
  [Comment]
  [Reference Data]-- connection: SomeDbNameHereselect columnn as labeltypenamefrom tableorder by column
  [Rules]
  "Is concept type Aggregation"
  "<Apprenticeship Assigned> is unique on <Apprenticeship>."
  "<Student> in <Apprenticeship Assigned> may occur max 2 times."
}
  TApprenticeship_Assigned = class(TCollectionItem)
  private
    { private declarations }
    FStudent: TStudent;
    FApprenticeship: TApprenticeship;
  protected
    { protected declarations }
    procedure SetStudent(aValue: TStudent);
    procedure SetApprenticeship(aValue: TApprenticeship);
  public
    { public declarations }
    procedure Assign(Source: TPersistent); override;
    function VerbalizedAsFacts: string;
  published
    { published declarations }
    property Student: TStudent read FStudent write SetStudent;
    property Apprenticeship: TApprenticeship read FApprenticeship write SetApprenticeship;
  end;

  // Collection of Apprenticeship_Assigned
  TApprenticeship_AssignedList = class(TCollection)
  protected
    function GetItems(index: integer): TApprenticeship_Assigned;
    procedure SetItems(index: integer; value: TApprenticeship_Assigned);
  protected
  public
    function IndexOf(aApprenticeship: TApprenticeship): integer;
    // ItemClass := TApprenticeship_Assigned in the constructor..
    property Items[index: integer]: TApprenticeship_Assigned read GetItems write SetItems;

  end;
);

{
  [Comment]
  one that is preferred
  [Definition]
  -- connection: SomeDbNameHereselect columnn as labeltypenamefrom tableorder by column
  [Reference Data]
  -- connection: SomeDbNameHereselect columnn as labeltypenamefrom tableorder by column
  [Rules]
  "<Apprenticeship Preference> is unique on <Student> and <number>."
  "<Apprenticeship Preference> is unique on <Student> and <Apprenticeship>."
  "<Student> in <Apprenticeship Preference> must occur 3 times."
}
{
  Owner
    Date : 08/02/2023 08:59:36
  Source
    Date : 08/02/2023 08:59:36
}
  TApprenticeship_Preference = class(TCollectionItem)
  private
    { private declarations }
    FStudent: TStudent;
    Fnumber: Tnumber;
    FApprenticeship: TApprenticeship;
  protected
    { protected declarations }
    procedure SetStudent(aValue: TStudent);
    procedure Setnumber(aValue: Tnumber);
    procedure SetApprenticeship(aValue: TApprenticeship);
  public
    { public declarations }
    procedure Assign(Source: TPersistent); override;
    function VerbalizedAsFacts: string;
  published
    { published declarations }
    property Student: TStudent read FStudent write SetStudent;
    property number: Tnumber read Fnumber write Setnumber;
    property Apprenticeship: TApprenticeship read FApprenticeship write SetApprenticeship;
  end;

  // Collection of Apprenticeship_Preference
  TApprenticeship_PreferenceList = class(TCollection)
  protected
    function GetItems(index: integer): TApprenticeship_Preference;
    procedure SetItems(index: integer; value: TApprenticeship_Preference);
  protected
  public
    function IndexOf(aStudent: TStudent; anumber: Tnumber): integer; overload;
    function IndexOf(aStudent: TStudent; aApprenticeship: TApprenticeship): integer; overload;
    // ItemClass := TApprenticeship_Preference in the constructor..
    property Items[index: integer]: TApprenticeship_Preference read GetItems write SetItems;

  end;
);

{
  [Rules]
  "Is concept type Location"
  "<City> is identified by <city_name>."
  "<City> must occur in <City Of Residence> and/or <Apprenticeship>."
}
  TCity = class(TCollectionItem)
  private
    { private declarations }
    Fcity_name: Tcity_name;
    FPopulation: TX_citizens;
  protected
    { protected declarations }
    procedure Setcity_name(aValue: Tcity_name);
    procedure SetPopulation(aValue: TX_citizens);
  public
    { public declarations }
    procedure Assign(Source: TPersistent); override;
    function VerbalizedAsFacts: string;
  published
    { published declarations }
    property city_name: Tcity_name read Fcity_name write Setcity_name;
    property Population: TX_citizens read FPopulation write SetPopulation;
  end;

  // Collection of City
  TCityList = class(TCollection)
  protected
    function GetItems(index: integer): TCity;
    procedure SetItems(index: integer; value: TCity);
  protected
  public
    function IndexOf(acity_name: Tcity_name): integer;
    // ItemClass := TCity in the constructor..
    property Items[index: integer]: TCity read GetItems write SetItems;

  end;
);

{
  [Rules]
  "Population supports Valid & Transaction Time"
  "<City Of Residence> is unique on <Student> and <City>."
  "<City> must occur in <City Of Residence> and/or <Apprenticeship>."
  "<City Of Residence> inhabits <Student>."
}
  TCity_Of_Residence = class(TCollectionItem)
  private
    { private declarations }
    FStudent: TStudent;
    FCity: TCity;
  protected
    { protected declarations }
    procedure SetStudent(aValue: TStudent);
    procedure SetCity(aValue: TCity);
  public
    { public declarations }
    procedure Assign(Source: TPersistent); override;
    function VerbalizedAsFacts: string;
  published
    { published declarations }
    property Student: TStudent read FStudent write SetStudent;
    property City: TCity read FCity write SetCity;
  end;

  // Collection of City_Of_Residence
  TCity_Of_ResidenceList = class(TCollection)
  protected
    function GetItems(index: integer): TCity_Of_Residence;
    procedure SetItems(index: integer; value: TCity_Of_Residence);
  protected
  public
    function IndexOf(aStudent: TStudent; aCity: TCity): integer;
    // ItemClass := TCity_Of_Residence in the constructor..
    property Items[index: integer]: TCity_Of_Residence read GetItems write SetItems;

  end;
);

{
  [Rules]
  "<Employee> is unique on <Emp_no>."
  "<Employee> must occur in <Person>."
}
  TEmployee = class(TCollectionItem)
  private
    { private declarations }
    FEmp_no: TEmp_no;
  protected
    { protected declarations }
    procedure SetEmp_no(aValue: TEmp_no);
  public
    { public declarations }
    procedure Assign(Source: TPersistent); override;
    function VerbalizedAsFacts: string;
  published
    { published declarations }
    property Emp_no: TEmp_no read FEmp_no write SetEmp_no;
  end;

  // Collection of Employee
  TEmployeeList = class(TCollection)
  protected
    function GetItems(index: integer): TEmployee;
    procedure SetItems(index: integer; value: TEmployee);
  protected
  public
    function IndexOf(aEmp_no: TEmp_no): integer;
    // ItemClass := TEmployee in the constructor..
    property Items[index: integer]: TEmployee read GetItems write SetItems;

  end;
);

{
  [Comment]
  [Reference Data]-- connection: SomeDbNameHereselect columnn as labeltypenamefrom tableorder by column
  [Rules]
  "Is concept type Person"
  "<Graduate>is a subtype of <Student> and <date>."
}
  TGraduate = class(TCollectionItem)
  private
    { private declarations }
    FStudent: TStudent;
    FGraduation_Date: Tdate;
  protected
    { protected declarations }
    procedure SetStudent(aValue: TStudent);
    procedure SetGraduation_Date(aValue: Tdate);
  public
    { public declarations }
    procedure Assign(Source: TPersistent); override;
    function VerbalizedAsFacts: string;
  published
    { published declarations }
    property Student: TStudent read FStudent write SetStudent;
    property Graduation_Date: Tdate read FGraduation_Date write SetGraduation_Date;
  end;

  // Collection of Graduate
  TGraduateList = class(TCollection)
  protected
    function GetItems(index: integer): TGraduate;
    procedure SetItems(index: integer; value: TGraduate);
  protected
  public
    function IndexOf(aStudent: TStudent): integer;
    // ItemClass := TGraduate in the constructor..
    property Items[index: integer]: TGraduate read GetItems write SetItems;

  end;
);

{
  [Rules]
  "<Person> is unique on <Student> and <Employee>."
}
  TPerson = class(TCollectionItem)
  private
    { private declarations }
    FBirthday: TDay;
    FStudent: TStudent;
    FEmployee: TEmployee;
  protected
    { protected declarations }
    procedure SetBirthday(aValue: TDay);
    procedure SetStudent(aValue: TStudent);
    procedure SetEmployee(aValue: TEmployee);
  public
    { public declarations }
    procedure Assign(Source: TPersistent); override;
    function VerbalizedAsFacts: string;
  published
    { published declarations }
    property Birthday: TDay read FBirthday write SetBirthday;
    property Student: TStudent read FStudent write SetStudent;
    property Employee: TEmployee read FEmployee write SetEmployee;
  end;

  // Collection of Person
  TPersonList = class(TCollection)
  protected
    function GetItems(index: integer): TPerson;
    procedure SetItems(index: integer; value: TPerson);
  protected
  public
    function IndexOf(aStudent: TStudent; aEmployee: TEmployee): integer;
    // ItemClass := TPerson in the constructor..
    property Items[index: integer]: TPerson read GetItems write SetItems;

  end;
);

{
  [Rules]
  "<street and number> is unique on <Street> and <house number>."
  "<street and number> must occur in <Address>."
}
  Tstreet_and_number = class(TCollectionItem)
  private
    { private declarations }
    FStreet: TStreet;
    Fhouse_number: Thouse_number;
  protected
    { protected declarations }
    procedure SetStreet(aValue: TStreet);
    procedure Sethouse_number(aValue: Thouse_number);
  public
    { public declarations }
    procedure Assign(Source: TPersistent); override;
    function VerbalizedAsFacts: string;
  published
    { published declarations }
    property Street: TStreet read FStreet write SetStreet;
    property house_number: Thouse_number read Fhouse_number write Sethouse_number;
  end;

  // Collection of street_and_number
  Tstreet_and_numberList = class(TCollection)
  protected
    function GetItems(index: integer): Tstreet_and_number;
    procedure SetItems(index: integer; value: Tstreet_and_number);
  protected
  public
    function IndexOf(aStreet: TStreet; ahouse_number: Thouse_number): integer;
    // ItemClass := Tstreet_and_number in the constructor..
    property Items[index: integer]: Tstreet_and_number read GetItems write SetItems;

  end;
);

{
  [Comment]
  [Definition]A person who attends a school, college, or university to follow theoretical classes and at least an apprenticeship.[Reference Data]-- connection: SomeDbNameHereselect columnn as labeltypenamefrom tableorder by column
  [Rules]
  "Is concept type Person"
  "<Student> is identified by <firstname> and <lastname>."
  "<Student> lives in <City Of Residence>."
}
  TStudent = class(TCollectionItem)
  private
    { private declarations }
    Ffirstname: Tfirstname;
    Flastname: Tlastname;
    FStudent_Mail_Address: TAddress;
    FStudent_Buddy_Buddy: TStudent;
    FStudent_Type: TType;
  protected
    { protected declarations }
    procedure Setfirstname(aValue: Tfirstname);
    procedure Setlastname(aValue: Tlastname);
    procedure SetStudent_Mail_Address(aValue: TAddress);
    procedure SetStudent_Buddy_Buddy(aValue: TStudent);
    procedure SetStudent_Type(aValue: TType);
  public
    { public declarations }
    procedure Assign(Source: TPersistent); override;
    function VerbalizedAsFacts: string;
  published
    { published declarations }
    property firstname: Tfirstname read Ffirstname write Setfirstname;
    property lastname: Tlastname read Flastname write Setlastname;
    property Student_Mail_Address: TAddress read FStudent_Mail_Address write SetStudent_Mail_Address;
    property Student_Buddy_Buddy: TStudent read FStudent_Buddy_Buddy write SetStudent_Buddy_Buddy;
    property Student_Type: TType read FStudent_Type write SetStudent_Type;
  end;

  // Collection of Student
  TStudentList = class(TCollection)
  protected
    function GetItems(index: integer): TStudent;
    procedure SetItems(index: integer; value: TStudent);
  protected
  public
    function IndexOf(afirstname: Tfirstname; alastname: Tlastname): integer;
    // ItemClass := TStudent in the constructor..
    property Items[index: integer]: TStudent read GetItems write SetItems;

  end;
);
implementation

  // more implementation code should be generated here...
function TX_crudList.IndexOf(aX_crud_ID: TX_crud_ID): integer;
var
  i: integer;
  V: TX_crud;
begin
  Result := -1;
  for i:=0 to Count-1 do
  begin
    V := Items[i];
    if (V.X_crud_ID = aX_crud_ID) then 
    begin
      Result := i;
      Exit;
    end;
  end;
end;

function TX_crudList.GetItems(index: integer): TX_crud;
begin
  Result := (inherited Items(index) as TX_crud);
end;

procedure TX_crudList.SetItems(index: integer; value: TX_crud);
begin
  Items[index].Assign(value);
end;


procedure TX_crud.SetX_crud_ID(aValue: TX_crud_ID);
begin
  FX_crud_ID := aValue;
end;

procedure TX_crud.SetX_crud_Created_By(aValue: TUsername);
begin
  FX_crud_Created_By := aValue;
end;

procedure TX_crud.SetX_crud_Updated_By(aValue: TUsername);
begin
  FX_crud_Updated_By := aValue;
end;

procedure TX_crud.SetX_crud_Created_On(aValue: TTimestamp);
begin
  FX_crud_Created_On := aValue;
end;

procedure TX_crud.SetX_crud_Updated_On(aValue: TTimestamp);
begin
  FX_crud_Updated_On := aValue;
end;

function TX_crud.VerbalizedAsFacts: string;
begin
  { TODO: replace strings with actual values }
  Result := 
    '"<$crud ID> is created by <$crud Created By>."'#13#10+
    '"<$crud ID> is updated by <$crud Updated By>."'#13#10+
    '"<$crud ID> is created on <$crud Created On>."'#13#10+
    '"<$crud ID> is updated on <$crud Updated On>."';
end;

procedure TX_crud.Assign(Source: TPersistent);
begin
  X_crud_ID := TX_crud(Source).X_crud_ID;
  X_crud_Created_By := TX_crud(Source).X_crud_Created_By;
  X_crud_Updated_By := TX_crud(Source).X_crud_Updated_By;
  X_crud_Created_On := TX_crud(Source).X_crud_Created_On;
  X_crud_Updated_On := TX_crud(Source).X_crud_Updated_On;
end;

function TAddressList.IndexOf(astreet_and_number: Tstreet_and_number; aCity: TCity; aProvence: TProvence; aCountry: TCountry): integer;
var
  i: integer;
  V: TAddress;
begin
  Result := -1;
  for i:=0 to Count-1 do
  begin
    V := Items[i];
    if (V.street_and_number = astreet_and_number) and 
       (V.City = aCity) and 
       (V.Provence = aProvence) and 
       (V.Country = aCountry) then 
    begin
      Result := i;
      Exit;
    end;
  end;
end;

function TAddressList.GetItems(index: integer): TAddress;
begin
  Result := (inherited Items(index) as TAddress);
end;

procedure TAddressList.SetItems(index: integer; value: TAddress);
begin
  Items[index].Assign(value);
end;


procedure TAddress.Setstreet_and_number(aValue: Tstreet_and_number);
begin
  Fstreet_and_number := aValue;
end;

procedure TAddress.SetCity(aValue: TCity);
begin
  FCity := aValue;
end;

procedure TAddress.SetProvence(aValue: TProvence);
begin
  FProvence := aValue;
end;

procedure TAddress.SetCountry(aValue: TCountry);
begin
  FCountry := aValue;
end;

function TAddress.VerbalizedAsFacts: string;
begin
  { TODO: replace strings with actual values }
  Result := 
end;

procedure TAddress.Assign(Source: TPersistent);
begin
  street_and_number := TAddress(Source).street_and_number;
  City := TAddress(Source).City;
  Provence := TAddress(Source).Provence;
  Country := TAddress(Source).Country;
end;

function TApprenticeshipList.IndexOf(aapprenticeship_code: Tapprenticeship_code): integer;
var
  i: integer;
  V: TApprenticeship;
begin
  Result := -1;
  for i:=0 to Count-1 do
  begin
    V := Items[i];
    if (V.apprenticeship_code = aapprenticeship_code) then 
    begin
      Result := i;
      Exit;
    end;
  end;
end;

function TApprenticeshipList.GetItems(index: integer): TApprenticeship;
begin
  Result := (inherited Items(index) as TApprenticeship);
end;

procedure TApprenticeshipList.SetItems(index: integer; value: TApprenticeship);
begin
  Items[index].Assign(value);
end;


procedure TApprenticeship.Setapprenticeship_code(aValue: Tapprenticeship_code);
begin
  Fapprenticeship_code := aValue;
end;

procedure TApprenticeship.SetApprenticeship_Description(aValue: Tdescription);
begin
  FApprenticeship_Description := aValue;
end;

procedure TApprenticeship.SetApprenticeship_City(aValue: TCity);
begin
  FApprenticeship_City := aValue;
end;

procedure TApprenticeship.SetApprenticeship_Duration(aValue: TMonth_Amount);
begin
  FApprenticeship_Duration := aValue;
end;

procedure TApprenticeship.SetApprenticeship_Category(aValue: TCategory_Title);
begin
  FApprenticeship_Category := aValue;
end;

function TApprenticeship.VerbalizedAsFacts: string;
begin
  { TODO: replace strings with actual values }
  Result := 
    '"Apprenticeship <apprenticeship_code> concerns <Apprenticeship Description>."'#13#10+
    '"Apprenticeship <apprenticeship_code> takes place in <city_name>."'#13#10+
    '"Apprenticeship <apprenticeship_code> vindt plaats in <city_name>."'#13#10+
    '"Apprenticeship <apprenticeship_code> betreft <Apprenticeship Description>."'#13#10+
    '"Apprenticeship <apprenticeship_code> will take <Apprenticeship Duration> months."'#13#10+
    '"Apprenticeship <apprenticeship_code> falls in the <Apprenticeship Category>."';
end;

procedure TApprenticeship.Assign(Source: TPersistent);
begin
  apprenticeship_code := TApprenticeship(Source).apprenticeship_code;
  Apprenticeship_Description := TApprenticeship(Source).Apprenticeship_Description;
  Apprenticeship_City := TApprenticeship(Source).Apprenticeship_City;
  Apprenticeship_Duration := TApprenticeship(Source).Apprenticeship_Duration;
  Apprenticeship_Category := TApprenticeship(Source).Apprenticeship_Category;
end;

function TApprenticeship_AssignedList.IndexOf(aApprenticeship: TApprenticeship): integer;
var
  i: integer;
  V: TApprenticeship_Assigned;
begin
  Result := -1;
  for i:=0 to Count-1 do
  begin
    V := Items[i];
    if (V.Apprenticeship = aApprenticeship) then 
    begin
      Result := i;
      Exit;
    end;
  end;
end;

function TApprenticeship_AssignedList.GetItems(index: integer): TApprenticeship_Assigned;
begin
  Result := (inherited Items(index) as TApprenticeship_Assigned);
end;

procedure TApprenticeship_AssignedList.SetItems(index: integer; value: TApprenticeship_Assigned);
begin
  Items[index].Assign(value);
end;


procedure TApprenticeship_Assigned.SetStudent(aValue: TStudent);
begin
  FStudent := aValue;
end;

procedure TApprenticeship_Assigned.SetApprenticeship(aValue: TApprenticeship);
begin
  FApprenticeship := aValue;
end;

function TApprenticeship_Assigned.VerbalizedAsFacts: string;
begin
  { TODO: replace strings with actual values }
  Result := 
    '"Apprenticeship <apprenticeship_code> is assigned to <firstname> <lastname>."';
end;

procedure TApprenticeship_Assigned.Assign(Source: TPersistent);
begin
  Student := TApprenticeship_Assigned(Source).Student;
  Apprenticeship := TApprenticeship_Assigned(Source).Apprenticeship;
end;

function TApprenticeship_PreferenceList.IndexOf(aStudent: TStudent; anumber: Tnumber): integer;
var
  i: integer;
  V: TApprenticeship_Preference;
begin
  Result := -1;
  for i:=0 to Count-1 do
  begin
    V := Items[i];
    if (V.Student = aStudent) and 
       (V.number = anumber) then 
    begin
      Result := i;
      Exit;
    end;
  end;
end;

function TApprenticeship_PreferenceList.IndexOf(aStudent: TStudent; aApprenticeship: TApprenticeship): integer;
var
  i: integer;
  V: TApprenticeship_Preference;
begin
  Result := -1;
  for i:=0 to Count-1 do
  begin
    V := Items[i];
    if (V.Student = aStudent) and 
       (V.Apprenticeship = aApprenticeship) then 
    begin
      Result := i;
      Exit;
    end;
  end;
end;

function TApprenticeship_PreferenceList.GetItems(index: integer): TApprenticeship_Preference;
begin
  Result := (inherited Items(index) as TApprenticeship_Preference);
end;

procedure TApprenticeship_PreferenceList.SetItems(index: integer; value: TApprenticeship_Preference);
begin
  Items[index].Assign(value);
end;


procedure TApprenticeship_Preference.SetStudent(aValue: TStudent);
begin
  FStudent := aValue;
end;

procedure TApprenticeship_Preference.Setnumber(aValue: Tnumber);
begin
  Fnumber := aValue;
end;

procedure TApprenticeship_Preference.SetApprenticeship(aValue: TApprenticeship);
begin
  FApprenticeship := aValue;
end;

function TApprenticeship_Preference.VerbalizedAsFacts: string;
begin
  { TODO: replace strings with actual values }
  Result := 
    '"<firstname> <lastname> has as preference no. <number> apprenticeship <apprenticeship_code>."'#13#10+
    '"<firstname> <lastname> heeft als voorkeur <number> de apprenticeship <apprenticeship_code>."';
end;

procedure TApprenticeship_Preference.Assign(Source: TPersistent);
begin
  Student := TApprenticeship_Preference(Source).Student;
  number := TApprenticeship_Preference(Source).number;
  Apprenticeship := TApprenticeship_Preference(Source).Apprenticeship;
end;

function TCityList.IndexOf(acity_name: Tcity_name): integer;
var
  i: integer;
  V: TCity;
begin
  Result := -1;
  for i:=0 to Count-1 do
  begin
    V := Items[i];
    if (V.city_name = acity_name) then 
    begin
      Result := i;
      Exit;
    end;
  end;
end;

function TCityList.GetItems(index: integer): TCity;
begin
  Result := (inherited Items(index) as TCity);
end;

procedure TCityList.SetItems(index: integer; value: TCity);
begin
  Items[index].Assign(value);
end;


procedure TCity.Setcity_name(aValue: Tcity_name);
begin
  Fcity_name := aValue;
end;

procedure TCity.SetPopulation(aValue: TX_citizens);
begin
  FPopulation := aValue;
end;

function TCity.VerbalizedAsFacts: string;
begin
  { TODO: replace strings with actual values }
  Result := 
    '"<city_name> has <Population> citizens."'#13#10+
    '"<city_name> heeft <Population> inwoners."';
end;

procedure TCity.Assign(Source: TPersistent);
begin
  city_name := TCity(Source).city_name;
  Population := TCity(Source).Population;
end;

function TCity_Of_ResidenceList.IndexOf(aStudent: TStudent; aCity: TCity): integer;
var
  i: integer;
  V: TCity_Of_Residence;
begin
  Result := -1;
  for i:=0 to Count-1 do
  begin
    V := Items[i];
    if (V.Student = aStudent) and 
       (V.City = aCity) then 
    begin
      Result := i;
      Exit;
    end;
  end;
end;

function TCity_Of_ResidenceList.GetItems(index: integer): TCity_Of_Residence;
begin
  Result := (inherited Items(index) as TCity_Of_Residence);
end;

procedure TCity_Of_ResidenceList.SetItems(index: integer; value: TCity_Of_Residence);
begin
  Items[index].Assign(value);
end;


procedure TCity_Of_Residence.SetStudent(aValue: TStudent);
begin
  FStudent := aValue;
end;

procedure TCity_Of_Residence.SetCity(aValue: TCity);
begin
  FCity := aValue;
end;

function TCity_Of_Residence.VerbalizedAsFacts: string;
begin
  { TODO: replace strings with actual values }
  Result := 
    '"<firstname> <lastname> lives in <city_name>."'#13#10+
    '"<firstname> <lastname> woont in <city_name>."';
end;

procedure TCity_Of_Residence.Assign(Source: TPersistent);
begin
  Student := TCity_Of_Residence(Source).Student;
  City := TCity_Of_Residence(Source).City;
end;

function TEmployeeList.IndexOf(aEmp_no: TEmp_no): integer;
var
  i: integer;
  V: TEmployee;
begin
  Result := -1;
  for i:=0 to Count-1 do
  begin
    V := Items[i];
    if (V.Emp_no = aEmp_no) then 
    begin
      Result := i;
      Exit;
    end;
  end;
end;

function TEmployeeList.GetItems(index: integer): TEmployee;
begin
  Result := (inherited Items(index) as TEmployee);
end;

procedure TEmployeeList.SetItems(index: integer; value: TEmployee);
begin
  Items[index].Assign(value);
end;


procedure TEmployee.SetEmp_no(aValue: TEmp_no);
begin
  FEmp_no := aValue;
end;

function TEmployee.VerbalizedAsFacts: string;
begin
  { TODO: replace strings with actual values }
  Result := 
end;

procedure TEmployee.Assign(Source: TPersistent);
begin
  Emp_no := TEmployee(Source).Emp_no;
end;

function TGraduateList.IndexOf(aStudent: TStudent): integer;
var
  i: integer;
  V: TGraduate;
begin
  Result := -1;
  for i:=0 to Count-1 do
  begin
    V := Items[i];
    if (V.Student = aStudent) then 
    begin
      Result := i;
      Exit;
    end;
  end;
end;

function TGraduateList.GetItems(index: integer): TGraduate;
begin
  Result := (inherited Items(index) as TGraduate);
end;

procedure TGraduateList.SetItems(index: integer; value: TGraduate);
begin
  Items[index].Assign(value);
end;


procedure TGraduate.SetStudent(aValue: TStudent);
begin
  FStudent := aValue;
end;

procedure TGraduate.SetGraduation_Date(aValue: Tdate);
begin
  FGraduation_Date := aValue;
end;

function TGraduate.VerbalizedAsFacts: string;
begin
  { TODO: replace strings with actual values }
  Result := 
    '"Graduate <firstname> <lastname> graduated on <Graduation Date>."'#13#10+
    '"Afgestudeerde <firstname> <lastname> studeerde af op <Graduation Date>."';
end;

procedure TGraduate.Assign(Source: TPersistent);
begin
  Student := TGraduate(Source).Student;
  Graduation_Date := TGraduate(Source).Graduation_Date;
end;

function TPersonList.IndexOf(aStudent: TStudent; aEmployee: TEmployee): integer;
var
  i: integer;
  V: TPerson;
begin
  Result := -1;
  for i:=0 to Count-1 do
  begin
    V := Items[i];
    if (V.Student = aStudent) and 
       (V.Employee = aEmployee) then 
    begin
      Result := i;
      Exit;
    end;
  end;
end;

function TPersonList.GetItems(index: integer): TPerson;
begin
  Result := (inherited Items(index) as TPerson);
end;

procedure TPersonList.SetItems(index: integer; value: TPerson);
begin
  Items[index].Assign(value);
end;


procedure TPerson.SetBirthday(aValue: TDay);
begin
  FBirthday := aValue;
end;

procedure TPerson.SetStudent(aValue: TStudent);
begin
  FStudent := aValue;
end;

procedure TPerson.SetEmployee(aValue: TEmployee);
begin
  FEmployee := aValue;
end;

function TPerson.VerbalizedAsFacts: string;
begin
  { TODO: replace strings with actual values }
  Result := 
    '"<firstname> <lastname> is born on <Birthday>."'#13#10+
    '"Employee <Emp_no> is born on <Birthday>."';
end;

procedure TPerson.Assign(Source: TPersistent);
begin
  Birthday := TPerson(Source).Birthday;
  Student := TPerson(Source).Student;
  Employee := TPerson(Source).Employee;
end;

function Tstreet_and_numberList.IndexOf(aStreet: TStreet; ahouse_number: Thouse_number): integer;
var
  i: integer;
  V: Tstreet_and_number;
begin
  Result := -1;
  for i:=0 to Count-1 do
  begin
    V := Items[i];
    if (V.Street = aStreet) and 
       (V.house_number = ahouse_number) then 
    begin
      Result := i;
      Exit;
    end;
  end;
end;

function Tstreet_and_numberList.GetItems(index: integer): Tstreet_and_number;
begin
  Result := (inherited Items(index) as Tstreet_and_number);
end;

procedure Tstreet_and_numberList.SetItems(index: integer; value: Tstreet_and_number);
begin
  Items[index].Assign(value);
end;


procedure Tstreet_and_number.SetStreet(aValue: TStreet);
begin
  FStreet := aValue;
end;

procedure Tstreet_and_number.Sethouse_number(aValue: Thouse_number);
begin
  Fhouse_number := aValue;
end;

function Tstreet_and_number.VerbalizedAsFacts: string;
begin
  { TODO: replace strings with actual values }
  Result := 
end;

procedure Tstreet_and_number.Assign(Source: TPersistent);
begin
  Street := Tstreet_and_number(Source).Street;
  house_number := Tstreet_and_number(Source).house_number;
end;

function TStudentList.IndexOf(afirstname: Tfirstname; alastname: Tlastname): integer;
var
  i: integer;
  V: TStudent;
begin
  Result := -1;
  for i:=0 to Count-1 do
  begin
    V := Items[i];
    if (V.firstname = afirstname) and 
       (V.lastname = alastname) then 
    begin
      Result := i;
      Exit;
    end;
  end;
end;

function TStudentList.GetItems(index: integer): TStudent;
begin
  Result := (inherited Items(index) as TStudent);
end;

procedure TStudentList.SetItems(index: integer; value: TStudent);
begin
  Items[index].Assign(value);
end;


procedure TStudent.Setfirstname(aValue: Tfirstname);
begin
  Ffirstname := aValue;
end;

procedure TStudent.Setlastname(aValue: Tlastname);
begin
  Flastname := aValue;
end;

procedure TStudent.SetStudent_Mail_Address(aValue: TAddress);
begin
  FStudent_Mail_Address := aValue;
end;

procedure TStudent.SetStudent_Buddy_Buddy(aValue: TStudent);
begin
  FStudent_Buddy_Buddy := aValue;
end;

procedure TStudent.SetStudent_Type(aValue: TType);
begin
  FStudent_Type := aValue;
end;

function TStudent.VerbalizedAsFacts: string;
begin
  { TODO: replace strings with actual values }
  Result := 
    '"<firstname> <lastname> is a student."'#13#10+
    '"<firstname> <lastname> is een scholier."'#13#10+
    '"<firstname> <lastname> receives mail at <Street><house number>,<city_name> <Provence> <Country>s."'#13#10+
    '"<firstname> <lastname> is a buddy for <firstname> <lastname>."'#13#10+
    '"<firstname> <lastname> is a <Student Type>."';
end;

procedure TStudent.Assign(Source: TPersistent);
begin
  firstname := TStudent(Source).firstname;
  lastname := TStudent(Source).lastname;
  Student_Mail_Address := TStudent(Source).Student_Mail_Address;
  Student_Buddy_Buddy := TStudent(Source).Student_Buddy_Buddy;
  Student_Type := TStudent(Source).Student_Type;
end;



initialization

finalization

end.
