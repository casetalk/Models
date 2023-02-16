
# Project    apprenticeship.prj
# Path    \\mac\home\documents\CaseTalk\GitHub\Models\EN\apprenticeship\
# Description    
# Repository    \\mac\home\documents\CaseTalk\GitHub\Models\EN\apprenticeship\apprenticeship.ig
# Author    marcow


# 
# [Rules]
# "<$crud> is identified by <$crud ID>."
# 
@dataclass
class X_crud:
  X_crud_ID: X_crud_ID
  X_crud_Created_By: Username
  X_crud_Updated_By: Username
  X_crud_Created_On: Timestamp
  X_crud_Updated_On: Timestamp


# 
# [Comment]
# [Definition]-- connection: SomeDbNameHereselect columnn as labeltypenamefrom tableorder by column[Reference Data]-- connection: SomeDbNameHereselect columnn as labeltypenamefrom tableorder by column
# [Rules]
# "Is concept type Location"
# "<Address> is unique on <street and number> and <City> and <Provence> and <Country>."
# "<Address> must occur in <Student>."
# 
@dataclass
class Address:
  street_and_number: street_and_number
  City: City
  Provence: Provence
  Country: Country


# 
# [Comment]
# a position as an apprentice : an arrangement in which someone learns an art, trade, or job under another.
# [Rules]
# "Is concept type Thing"
# "<Apprenticeship> is identified by <apprenticeship_code>."
# "<City> must occur in <City Of Residence> and/or <Apprenticeship>."
# 
@dataclass
class Apprenticeship:
  apprenticeship_code: apprenticeship_code
  Apprenticeship_Description: description
  Apprenticeship_City: City
  Apprenticeship_Duration: Month_Amount
  Apprenticeship_Category: Category_Title


# 
# [Comment]
# [Reference Data]-- connection: SomeDbNameHereselect columnn as labeltypenamefrom tableorder by column
# [Rules]
# "Is concept type Aggregation"
# "<Apprenticeship Assigned> is unique on <Apprenticeship>."
# "<Student> in <Apprenticeship Assigned> may occur max 2 times."
# 
@dataclass
class Apprenticeship_Assigned:
  Student: Student
  Apprenticeship: Apprenticeship


# 
# [Comment]
# one that is preferred
# [Definition]
# -- connection: SomeDbNameHereselect columnn as labeltypenamefrom tableorder by column
# [Reference Data]
# -- connection: SomeDbNameHereselect columnn as labeltypenamefrom tableorder by column
# [Rules]
# "<Apprenticeship Preference> is unique on <Student> and <number>."
# "<Apprenticeship Preference> is unique on <Student> and <Apprenticeship>."
# "<Student> in <Apprenticeship Preference> must occur 3 times."
# 
# 
# Owner
#   Date : 08/02/2023 08:59:36
# Source
#   Date : 08/02/2023 08:59:36
# 
@dataclass
class Apprenticeship_Preference:
  Student: Student
  number: number
  Apprenticeship: Apprenticeship


# 
# [Rules]
# "Is concept type Location"
# "<City> is identified by <city_name>."
# "<City> must occur in <City Of Residence> and/or <Apprenticeship>."
# 
@dataclass
class City:
  city_name: city_name
  Population: X_citizens


# 
# [Rules]
# "Population supports Valid & Transaction Time"
# "<City Of Residence> is unique on <Student> and <City>."
# "<City> must occur in <City Of Residence> and/or <Apprenticeship>."
# "<City Of Residence> inhabits <Student>."
# 
@dataclass
class City_Of_Residence:
  Student: Student
  City: City


# 
# [Rules]
# "<Employee> is unique on <Emp_no>."
# "<Employee> must occur in <Person>."
# 
@dataclass
class Employee:
  Emp_no: Emp_no


# 
# [Comment]
# [Reference Data]-- connection: SomeDbNameHereselect columnn as labeltypenamefrom tableorder by column
# [Rules]
# "Is concept type Person"
# "<Graduate>is a subtype of <Student> and <date>."
# 
@dataclass
class Graduate:
  Student: Student
  Graduation_Date: date


# 
# [Rules]
# "<Person> is unique on <Student> and <Employee>."
# 
@dataclass
class Person:
  Birthday: Day
  Student: Student
  Employee: Employee


# 
# [Rules]
# "<street and number> is unique on <Street> and <house number>."
# "<street and number> must occur in <Address>."
# 
@dataclass
class street_and_number:
  Street: Street
  house_number: house_number


# 
# [Comment]
# [Definition]A person who attends a school, college, or university to follow theoretical classes and at least an apprenticeship.[Reference Data]-- connection: SomeDbNameHereselect columnn as labeltypenamefrom tableorder by column
# [Rules]
# "Is concept type Person"
# "<Student> is identified by <firstname> and <lastname>."
# "<Student> lives in <City Of Residence>."
# 
@dataclass
class Student:
  firstname: firstname
  lastname: lastname
  Student_Mail_Address: Address
  Student_Buddy_Buddy: Student
  Student_Type: Type

