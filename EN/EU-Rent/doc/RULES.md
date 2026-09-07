# EU-Rent — business rules

The twenty-two rules held as `rule` OFTypes in the container **EU-Rent Business Rules**. Each
rule in the repository carries its statement in a `[Definition]` annotation and its provenance
in a `[Source]` annotation; both are reproduced here.

**Structural** means the model already enforces the rule through a uniqueness, totality or
value constraint — no code can violate it. **Derivation** means the rule cannot be a
constraint on a single fact type; since 2026-09-05 each such rule carries a `[Derivation]`
annotation in the repository that states it as a check over role paths (for example
`FOR EACH Rental R: COUNT(Additional Driver[R]) <= 3`), names the counter-example in the
population that violates it, and says which threshold is assumed. The four derived Rental
subtypes (Advance, Walk-in, One-Way, Open) are flagged *derivable* with their defining
condition. The notation is readable, not executable — choosing a formal target is on the
todo list. This is the
distinction SBVR draws between *structural* (definitional) rules and *behavioural* rules,
and it is the honest way to read the model: half of EU-Rent's rules are simply not
expressible as constraints on single fact types.

| # | Rule | Enforcement |
|---|---|---|
| R01 | Each car model is classified in exactly one car group | **Structural** — UC + TC on `Car Group of Car Model` |
| R02 | Each rental has exactly one requested car group | **Structural** — UC + TC on `Requested Car Group` |
| R03 | Each rental has at most three additional drivers | Derivation — a cardinality rule over `Additional Driver` |
| R04 | A barred driver may not be the main or an additional driver of a rental | Derivation — behavioural |
| R05 | Each driver of a rental holds a licence valid to the return date | Partly structural (TC makes licence and expiry mandatory); the date comparison is a derivation |
| R06 | Each driver is at least 21 years old on the pick-up date | Derivation — compares `Date of Birth` with `Rental Period` |
| R07 | The rental period is at most 90 days | Derivation — spans both date roles of `Rental Period` |
| R08 | The drop-off branch of a rental is an EU-Rent branch | **Structural** — the role is played by Branch, so nothing else can be named |
| R09 | A one-way rental incurs a location penalty charge | Derivation — compares the pick-up and drop-off Branch roles |
| R10 | **Area of Usage Rule** — no rented car of an open rental may be outside the authorized area of the rental | Derivation — behavioural, and violable by design |
| R11 | **Remedial** — an open rental must be cancelled if R10 is violated | The `Open -> Cancelled` transition exists in the `Rental Status` VC; the trigger is a derivation |
| R12 | If the requested car group is unavailable, allocate a higher group at the requested group's tariff | Derivation — needs availability, which is out of scope |
| R13 | The allocated car is in the requested car group or a higher one | Derivation — a join over `Car of Rental` → `Car Model of Car` → `Car Group of Car Model` |
| R14 | A car is serviced at intervals of at most 5000 miles | Derivation — compares odometer with last service mileage |
| R15 | Only an Available car may be rented | **Structural** — the `Condition` state machine only allows `Available -> Rented` |
| R16 | Each rental is guaranteed by a credit card of the renter | **Structural** — TC on the Customer role of `Customer Credit Card` |
| R17 | All cars in a car group have the same tariff within a country | **Structural** — the tariff hangs off Car Group + Country, under one UC |
| R18 | A late return incurs a penalty | Derivation — compares `Actual Return` with `Rental Period` |
| R19 | Three bad experiences bar a driver | Derivation — counts `Bad Experience` tuples per driver |
| R20 | The renter drives, or nominates a driver | Partly structural — `Main Driver of Rental` is mandatory for a Rental |
| R22 | A customer has at most one open rental at a time; reservations are unlimited | Derivation — counts `Open Rental` per Customer through `Renter of Rental` |
| R23 | The signing (main) driver of a rental has no other car on rental | Derivation — counts `Open Rental` per Driver through `Main Driver of Rental` |

R21 is reserved for the fleet disposal rule (sold at one year or 40,000 km), still on the
todo list.

## Quoted verbatim

Two rules are quoted word for word from the Business Rules Journal, where they are used to
show the SBVR distinction between a behavioural rule and the remedial rule that responds when
it is broken:

> **R10** — "No rented car *of* an open rental may *be outside* the authorized area *of* the rental."
>
> **R11** — "An open rental must *be canceled* if the **Area of Usage Rule** *is violated* by the rental."

— *SBVR Speaks on Rules: Violations of Business Rules*,
<https://www.brcommunity.com/articles.php?id=c009>

R03 is likewise a standard SBVR EU-Rent example statement: *"It is obligatory that each rental
has at most three additional drivers."*

R22 and R23 are quoted from the original 1995 case study (Business Rules Group report,
Appendix D, by Model Systems Ltd.): *"A customer can have several reservations but only one
car rented at a time"* and *"The driver who signs the rental agreement must not currently have
a EU-Rent car on rental."* Rental IS the rental agreement in this model, and the signing driver
is the main driver (R20).

## Three numbers the sources do not fix

The published EU-Rent material states the *shape* of these rules but not their thresholds.
The model states a plausible value and says so in the rule's annotation; each is on the
project todo list as a question for the business.

| Rule | Assumed value | Why that value |
|---|---|---|
| R06 | minimum driver age **21** | Matches common European rental practice |
| R07 | maximum rental period **90 days** | A conventional long-rental cap |
| R19 | **three** bad experiences before barring | The sources say EU-Rent "may bar" drivers, without a count |
