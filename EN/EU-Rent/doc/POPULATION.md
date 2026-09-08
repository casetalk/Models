# EU-Rent — sample population

The dataset the model carries. It is small on purpose: enough to make every constraint bite,
and to show each rule both satisfied and violated.

## State (2026-09-05)

**Everything below is in the repository**, entered through the MCP `population insert` tool
after the identification of the eight object types was repaired (see SESSION-NOTES.md §6).
Each object type is now identified by its own expression, so a value such as `NL` in an
object column *is* the country: the instances of Country, Local Area, Branch, Car Group, Car
Model, Car, Person and Rental are born from the first fact that mentions them, which is how
FCO-IM population works. All ordinary tuples are **confirmed**; the counter-examples at the
end are entered **unconfirmed and flagged `is_counter_example`**.

Column convention for the `values` of an insert: one value per lexical column, left to right,
with an object-type role expanded to its identifying label(s). So `Car Model of Car` takes
three values (`NL-G-482-TK,Volkswagen,Polo`) because Car Model is identified by Manufacturer
plus Model Name, and a Driver or Customer role takes the Person Number.

### Network

```
Name of Country          NL → Netherlands · BE → Belgium · DE → Germany · FR → France
Country of Local Area    NL-NH → NL · NL-ZH → NL · BE-BRU → BE · DE-NRW → DE
Name of Branch           AMS01 → Amsterdam Schiphol · AMS02 → Amsterdam Centraal
                         BRU01 → Brussels Airport   · DUS01 → Dusseldorf Hbf
Local Area of Branch     AMS01 → NL-NH · AMS02 → NL-NH · BRU01 → BE-BRU · DUS01 → DE-NRW
Branch City              AMS01 → Amsterdam · AMS02 → Amsterdam · BRU01 → Brussels · DUS01 → Dusseldorf
```

### Fleet

```
Description of Car Group  A → Economy small hatchback · B → Compact hatchback
                          C → Intermediate saloon     · D → Full size estate
                          E → Premium saloon          · F → Luxury saloon
Car Group of Car Model    Volkswagen Polo → A · Opel Astra → B · Volvo V60 → D · BMW 5 Series → E
Car Model of Car          NL-G-482-TK → Volkswagen Polo · NL-H-517-ZR → Opel Astra
                          BE-2-XYZ-123 → Volvo V60       · DE-D-AB-1234 → BMW 5 Series
                          NL-K-903-LP → Volkswagen Polo · DE-D-CD-5678 → BMW 5 Series
                          NL-J-286-XB → Opel Astra
Home Branch of Car        NL-G-482-TK → AMS01 · NL-H-517-ZR → AMS01
                          BE-2-XYZ-123 → BRU01 · DE-D-AB-1234 → DUS01
                          NL-K-903-LP → AMS01 · DE-D-CD-5678 → DUS01 · NL-J-286-XB → AMS01
Purchase Date of Car      NL-G-482-TK → 2025-11-03 · NL-H-517-ZR → 2026-02-17
                          BE-2-XYZ-123 → 2025-10-21 · DE-D-AB-1234 → 2026-07-30
                          NL-K-903-LP → 2025-06-02           ← fifteen months old on 2026-09-08: R21 (age)
                          DE-D-CD-5678 → 2026-01-12 · NL-J-286-XB → 2025-05-12
Car Odometer Reading      NL-G-482-TK → 23800 · NL-H-517-ZR → 12750
                          BE-2-XYZ-123 → 24400 · DE-D-AB-1234 → 4900
                          NL-K-903-LP → 19300 · NL-J-286-XB → 24100
                          DE-D-CD-5678 → 31200               ← over 25,000 miles (40,000 km): R21 (distance)
Car Condition             NL-G-482-TK → Available · NL-H-517-ZR → Rented
                          BE-2-XYZ-123 → In Service · DE-D-AB-1234 → Available
                          NL-K-903-LP → Available · DE-D-CD-5678 → Available   ← should be Sold: the R21 counter-examples
                          NL-J-286-XB → Sold                                   ← sold at one year old, 24100 miles
Car Service               NL-G-482-TK, 2026-06-14, 20000
                          NL-H-517-ZR, 2026-07-02, 10000
                          BE-2-XYZ-123, 2026-03-11, 18000     ← 6400 miles ago: R14 violated
Car Transfer Movement     NL-H-517-ZR, from AMS01 to BRU01, 2026-09-06   ← returning a one-way car
```

### Parties

```
Name of Person        1001 → Anna de Vries · 1002 → Bram Janssen
                      1003 → Chloe Dupont  · 1004 → Dieter Kloss
Date of Birth         1001 → 1988-04-12 · 1002 → 1995-11-30
                      1003 → 2007-02-18 · 1004 → 1972-08-05   ← 1003 is under 21: R06
Customer              1001 · 1002 · 1004
Driver                1001 · 1002 · 1003 · 1004
Driving Licence       1001 → NL-DL-4471 · 1002 → NL-DL-9920
                      1003 → FR-DL-1180 · 1004 → DE-DL-3345
Licence Expiry        1001 → 2030-04-12 · 1002 → 2027-11-30
                      1003 → 2029-02-18 · 1004 → 2026-09-01   ← expires mid-rental: R05
Customer Credit Card  1001 → 4111...1111 · 1002 → 5500...0004 · 1004 → 3400...0009
Bad Experience        1002, Late Return,  2026-02-03
                      1002, Unpaid Fine,  2026-04-19
                      1002, Damage To Car,2026-06-27          ← three: R19 fires
Barred Driver         1002                                     ← the consequence of R19
```

### Rentals

```
Rental 10001 — the ordinary case
  Renter of Rental        10001 → 1001
  Requested Car Group     10001 → B
  Pick Up Branch          10001 → AMS01
  Drop Off Branch         10001 → BRU01          ← one-way: R09 fires
  Rental Period           10001, 2026-09-01, 2026-09-05
  Car of Rental           10001 → NL-H-517-ZR
  Main Driver of Rental   10001 → 1001
  Rental State            10001 → Open
  Authorized Area         10001 → NL-NH, NL-ZH, BE-BRU
  Rental Charge           10001, Rental Charge, 196.00
                          10001, Location Penalty Charge, 45.00

Rental 10002 — an advance booking, no car allocated yet
  Renter of Rental        10002 → 1004
  Requested Car Group     10002 → E
  Pick Up Branch          10002 → DUS01
  Drop Off Branch         10002 → DUS01
  Rental Period           10002, 2026-09-20, 2026-09-24
  Main Driver of Rental   10002 → 1004
  Rental State            10002 → Requested
  Authorized Area         10002 → DE-NRW
  (no Car of Rental — this is why that role is optional)

Rental 10003 — closed, returned late
  Renter of Rental        10003 → 1002
  Requested Car Group     10003 → A
  Pick Up Branch          10003 → AMS02
  Drop Off Branch         10003 → AMS02
  Rental Period           10003, 2026-08-01, 2026-08-08
  Car of Rental           10003 → NL-G-482-TK
  Main Driver of Rental   10003 → 1002
  Additional Driver       10003 → 1001
  Actual Return           10003 → 2026-08-11        ← three days late: R18 fires
  Rental State            10003 → Closed
  Authorized Area         10003 → NL-NH
  Rental Charge           10003, Rental Charge, 231.00
                          10003, Late Return Penalty, 90.00
```

### Tariff

```
Rental Tariff   A/NL 39.00   B/NL 49.00   C/NL 59.00   D/NL 79.00   E/NL 109.00   F/NL 159.00
                A/BE 41.00   B/BE 52.00   D/BE 84.00
                A/DE 43.00   B/DE 54.00   E/DE 119.00
```

## Counter-examples

These tuples are in the repository as **counter-examples** (`is_counter_example`) — a
population that documents what the constraints and rules are meant to forbid. Each carries a
tuple comment naming the rule. Note that rentals 10004–10010 exist only through the
fact(s) that violate a rule; they have none of their mandatory facts (see the todo list).

| Counter-example | Forbidden by |
|---|---|
| Rental 10004 driven by person 1002 | R04 — 1002 is a barred driver |
| Rental 10005 with four additional drivers | R03 |
| Rental 10006 running 2026-09-01 to 2026-12-15 | R07 — 105 days |
| Rental 10007 fulfilled with BE-2-XYZ-123 | R15 — that car is In Service |
| Rental 10008 requesting group E, fulfilled with a Polo (group A) | R13 — a downgrade |
| Two `Rental Tariff` rows for B/NL | UC over (Car Group, Country) |
| Rental 10009, renter 1001, state Open while 10001 is still Open | R22 — one car on rental at a time |
| Rental 10010, main driver 1001, state Open while 10001 is still Open | R23 — the signing driver has no car out |
| Car NL-K-903-LP still Available, purchased 2025-06-02 (fifteen months old on 2026-09-08) | R21 — sold at one year old |
| Car DE-D-CD-5678 still Available at 31200 miles (50,200 km) | R21 — sold at 40,000 km |
| ~~A second Car Model "Opel / Astra"~~ — not entered: Car Model is identified by its own expression, so a duplicate is the same instance | UC over (Manufacturer, Model Name) on Car Model |
