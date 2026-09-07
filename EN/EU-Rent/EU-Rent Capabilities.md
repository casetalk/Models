# EU-Rent — Organisational Capabilities

> Derived from the conceptual model `eu-rent.ig` (117 object-fact types), organised
> around the model's six business containers and its 20 named business rules.
> This document describes **what the organisation is able to do**; the model
> describes the facts each capability produces and consumes.

## Business Context

EU-Rent is a car rental company operating a network of branches across several
countries. It rents cars from its fleet to customers under rental agreements,
charges for those rentals, and enforces a body of business rules covering
eligibility, availability, pricing and vehicle servicing.

---

## Capability Map

EU-Rent's capabilities correspond one-to-one with the model's container
structure. Each capability below lists the concepts it is built on and the
business rules that govern it.

### 1. Network Management  *(EU-Rent Network)*

Operate and structure the geographic branch network.

- **Manages:** Country, Local Area, Branch, City
- **Enables:** locating branches, defining service areas, supporting one-way
  rentals between branches (Pick Up / Drop Off Branch).

### 2. Fleet Management  *(EU-Rent Fleet)*

Acquire, classify, position and maintain the vehicle fleet.

- **Manages:** Car, Car Model, Car Group, Manufacturer, Home Branch, Car
  Transfer, Car Service, Odometer/Mileage.
- **Governed by:**
  - R01 — a Car Model belongs to exactly one Car Group
  - R14 — service interval of 5,000 miles
  - R15 — only an available car may be rented

### 3. Party Management  *(EU-Rent Parties)*

Manage the people and organisations EU-Rent deals with.

- **Manages:** Person, Customer, Driver, Additional Driver, Driving Licence,
  Credit Card, Barred Driver, Bad Experience.
- **Governed by:**
  - R04 — a barred driver may not drive
  - R05 — a driver must hold a valid licence
  - R06 — minimum driver age
  - R19 — three bad experiences bar a driver

### 4. Rental Process Management  *(EU-Rent Rental Process)*

Handle the full rental lifecycle from request to return.

- **Manages:** Rental (Advance, Walk-in, Open, One-Way), Rental Agreement,
  Rental Period, Rental State, Requested/Allocated Car Group, Main &
  Additional Drivers, Actual Return.
- **Governed by:**
  - R02 — a rental requests exactly one car group
  - R03 — maximum three additional drivers
  - R07 — maximum rental duration
  - R08 — drop-off branch must be an EU-Rent branch
  - R10 / R11 — area-of-usage rule and its remedial rule
  - R12 — free upgrade when the requested group is unavailable
  - R13 — the allocated car matches or exceeds the requested group
  - R16 — rental guaranteed by credit card
  - R20 — the renter drives or nominates a driver

### 5. Charging & Revenue  *(EU-Rent Charging)*

Price rentals and calculate charges.

- **Manages:** Rental Tariff, Daily Rate, Rental Charge, Charge Kind/Amount,
  Advance Rental.
- **Governed by:**
  - R09 — one-way rental incurs a location penalty charge
  - R17 — one tariff per car group per country
  - R18 — late return incurs a penalty

### 6. Governance & Business Rules  *(EU-Rent Business Rules)*

Define, hold and enforce the 20 named business rules (R01–R20) that constrain
all other capabilities. This is the organisation's rule-management capability —
the single place where policy is expressed as verifiable constraints on the
facts above.

---

## Capability–Rule Coverage Summary

| Capability | Governing rules |
|---|---|
| Network Management | R08 |
| Fleet Management | R01, R14, R15 |
| Party Management | R04, R05, R06, R19 |
| Rental Process Management | R02, R03, R07, R08, R10, R11, R12, R13, R16, R20 |
| Charging & Revenue | R09, R17, R18 |
| Governance & Business Rules | R01–R20 (owner) |

---

## Notes & Provenance

- **Source:** conceptual model `eu-rent.ig`, containers and business-rule
  object-fact types as modelled.
- **Not yet in the model:** no capability canvas exists in the project
  (`canvas` folder is empty). This document is a first, model-grounded draft —
  consider capturing it as a structured Business Capability canvas so it stays
  in sync with the model.
