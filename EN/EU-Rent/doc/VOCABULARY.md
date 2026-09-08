# EU-Rent — vocabulary

Every fact type in `eu-rent.ig` (34 fact types plus the two subtype expressions Customer and
Driver), with its expression and its constraints. Every fact type carries sample population —
see [POPULATION.md](POPULATION.md).
Role players are written `<Like This>`; a `|datatype` marks a label type.

**Reading the constraints.** `UC` is a uniqueness constraint over the fact type's own roles —
it is what states identification and functional dependency. `TC` is a totality constraint over
the roles an object type plays — it is what states mandatory participation. `VC` is a value
constraint on a label type.

---

## Object types (8)

Each object type is identified by its **own object type expression** (OTE): one identifying
role to a label type, under a uniqueness constraint. There is no separate "X Identification"
fact type any more — that shape (a concept plus a binary fact saying what identifies it) was
what the first session produced and was repaired on 2026-09-05.

| Object type | Object type expression | Static? |
|---|---|---|
| Country | `<Country Code\|string>` | yes — the countries EU-Rent operates in are a closed set |
| Local Area | `<Local Area Code\|string>` | |
| Branch | `<Branch Code\|string>` | |
| Car Group | `<Car Group Code\|string>` | yes — A..F is a closed set |
| Car Model | `<Manufacturer\|string> <Model Name\|string>` — composite, one UC over both roles | |
| Car | `<Registration Number\|string>` | |
| Person | `<Person Number\|integer>` | |
| Rental | `<Rental Number\|integer>` | |

Subtypes: **Customer** and **Driver** of Person; **Advance Rental**, **Walk-in Rental**,
**One-Way Rental** and **Open Rental** of Rental.

---

## Network

| Fact type | Expression | Constraints |
|---|---|---|
| Name of Country | `<Country> is named <Country Name\|string>` | UC each role (1:1); TC on Country |
| Country of Local Area | `<Local Area> lies in <Country>` | UC on Local Area; TC on Local Area |
| Name of Branch | `<Branch> is called <Branch Name\|string>` | UC on Branch; TC |
| Local Area of Branch | `<Branch> belongs to <Local Area>` | UC on Branch; TC |
| Branch City | `<Branch> is situated in <City\|string>` | UC on Branch; TC |

`Country Code` also carries a **value pattern** `[A-Z]{2}` — the one thing a value constraint
cannot say, because it constrains the *shape* of a value rather than listing values.

## Fleet

| Fact type | Expression | Constraints |
|---|---|---|
| Description of Car Group | `<Car Group> is described as <Car Group Description\|string>` | UC on Car Group; TC |
| Car Group of Car Model | `<Car Model> is classified in <Car Group>` | UC on Car Model; TC |
| Car Model of Car | `<Car> is of model <Car Model>` | UC on Car; TC |
| Home Branch of Car | `<Car> is stationed at <Branch>` | UC on Car; TC |
| Car Odometer Reading | `<Car> has odometer reading <Mileage\|integer>` | UC on Car |
| Car Condition | `<Car> is in condition <Condition\|string>` | UC on Car; TC; VC (state machine) |
| Purchase Date of Car | `<Car> was purchased on <Purchase Date\|date>` | UC on Car; TC |
| Car Service | `<Car> was serviced on <Service Date\|date> at mileage <Service Mileage\|integer>` | UC on Car + Service Date; composite |
| Car Transfer Movement | `<Car> was transferred from <Branch[From..]> to <Branch[To..]> on <Transfer Date\|date>` | UC on Car + Transfer Date; composite |

`Car Transfer Movement` is where Branch plays **two roles in one predicate**; the role fixes
`[From..]` and `[To..]` are what tell them apart.

## Parties

| Fact type | Expression | Constraints |
|---|---|---|
| Name of Person | `<Person> is named <Person Name\|string>` | UC on Person; TC |
| Date of Birth | `<Person> was born on <Birth Date\|date>` | UC on Person; TC |
| Customer | `<Person> is a customer of EU-Rent` | subtype; UC |
| Driver | `<Person> is a qualified driver` | subtype; UC |
| Driving Licence | `<Driver> holds driving licence <Licence Number\|string>` | UC each role; TC on Driver |
| Licence Expiry | `<Driver> holds a licence valid until <Licence Expiry Date\|date>` | UC on Driver; TC |
| Barred Driver | `<Driver> is barred from renting` | UC (unary) |
| Bad Experience | `<Driver> caused a bad experience of kind <Bad Experience Kind\|string> on <Incident Date\|date>` | UC spanning all roles; VC on kind |
| Customer Credit Card | `<Customer> guarantees payment with card <Credit Card Number\|string>` | UC on card; TC on Customer |

A **TC spanning the Customer and Driver roles of Person** says every person must be at least
one of the two.

## Rental process

| Fact type | Expression | Constraints |
|---|---|---|
| Renter of Rental | `<Rental> is contracted by <Customer>` | UC on Rental; TC |
| Requested Car Group | `<Rental> requests <Car Group>` | UC on Rental; TC |
| Pick Up Branch | `<Rental> is picked up at <Branch>` | UC on Rental; TC |
| Drop Off Branch | `<Rental> is dropped off at <Branch>` | UC on Rental; TC |
| Rental Period | `<Rental> runs from <Pick Up Date\|date> until <Return Date\|date>` | UC on Rental; TC; composite |
| Car of Rental | `<Rental> is fulfilled with <Car>` | UC on Rental — optional: a Requested rental has no car yet |
| Main Driver of Rental | `<Rental> is driven by <Driver>` | UC on Rental; TC |
| Additional Driver | `<Rental> has additional driver <Driver>` | UC spanning both roles (M:N) |
| Rental State | `<Rental> is in state <Rental Status\|string>` | UC on Rental; TC; VC (state machine) |
| Actual Return | `<Rental> was actually returned on <Actual Return Date\|date>` | UC on Rental — optional until returned |
| Authorized Area of Rental | `<Rental> is authorized for use in <Local Area>` | UC spanning both roles (M:N) |

## Charging

| Fact type | Expression | Constraints |
|---|---|---|
| Rental Tariff | `<Car Group> in <Country> costs <Daily Rate\|currency> per day` | UC on Car Group + Country; composite |
| Rental Charge | `<Rental> incurs a <Charge Kind\|string> of <Charge Amount\|currency>` | UC on Rental + Charge Kind; composite; VC on kind |

---

## Value constraints

`Car Group Code` — a **labelled enumeration**, in ascending tariff order. The order is what
makes "a higher car group" meaningful in R12 and R13.

```
A=Economy   B=Compact   C=Intermediate   D=Full Size   E=Premium   F=Luxury
```

`Condition` — a **state machine**. A car enters the fleet Available, can only be rented from
Available, is sold (R21) from Available or In Service but never while Rented, and once
written off or sold never returns to service.

```
[*] -> Available
Available   -> Rented ; In Service ; Written Off ; Sold
Rented      -> Available ; In Service ; Written Off
In Service  -> Available ; Written Off ; Sold
Written Off -> [*]
Sold        -> [*]
```

`Rental Status` — a **state machine**. An advance booking is Requested, becomes Open at
pick-up and Closed at return; it may be Cancelled before or during the rental, which is what
R11, the remedial rule, needs.

```
[*] -> Requested
Requested -> Open ; Cancelled
Open      -> Closed ; Cancelled
Closed    -> [*]
Cancelled -> [*]
```

`Bad Experience Kind` — enumeration: Police Action, Unpaid Fine, Damage To Car, Late Return,
Non Return, Unpaid Charge.

`Charge Kind` — enumeration: Rental Charge, Location Penalty Charge, Late Return Penalty,
Fuel Charge, Damage Charge, One Way Charge.
