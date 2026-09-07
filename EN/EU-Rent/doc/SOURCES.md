# EU-Rent — sources

EU-Rent was originally developed by **Model Systems Ltd.** of the United Kingdom. It became
the case study of the **OMG SBVR specification** (the EU-Rent annex), and is used throughout
the work of the **Business Rules Group**. It is also a standing example in the Object-Role
Modeling literature, which is where the branch / car group / blacklisted-customer framing
comes from.

Every element in the repository carries its provenance in a `[Source]` annotation.

## The original (oldest) source

| Source | What it is |
|---|---|
| [Defining Business Rules ~ What Are They Really?](https://www.businessrulesgroup.org/first_paper/BRG-whatisBR_3ed.pdf) — the Business Rules Group, final report of the GUIDE Business Rules Project. First published as a GUIDE publication in **1995**, revised 1997, revision 1.3 July 2000 (the readable copy). | Appendix D, *Case Study: EU-Rent Car Rentals*, "developed by Model Systems, Ltd. of the United Kingdom" (example by John Hall). The material "may be copied and used freely, if its source is clearly acknowledged". Every later retelling, including the SBVR annex, descends from it. |

The original differs from the SBVR-era pages the model was built from in a few points, each
now on the todo list:

- EU-Rent is one of three businesses of **EU-Corporation**, with EU-Fly and EU-Stay hotels
  and a shared customer base.
- It has **1000 branches**, plus separate **service depots** that each serve several branches
  and take maintenance bookings subject to capacity.
- Cars are **sold at one year old or 40,000 km**. The 5000-mile service interval (R14) is from
  the later SBVR retelling.
- A customer may hold several reservations but **only one car on rental at a time**, and the
  **signing driver must not currently have an EU-Rent car out** — modelled as R22 and R23.

## Pages the model was built from

| Source | What was taken from it |
|---|---|
| [EU-Rent Example — KDM Analytics](https://kdmanalytics.com/sbvr/EU-Rent.html) | The business context; the cross-border insurance concern behind the authorized area (R10); the location penalty charge (R08, R09); driver qualification (R05, R06); rental duration (R07); payment guarantee (R16) |
| [Sample business rules specified in SBVR — KDM Analytics](https://kdmanalytics.com/sbvr/sbvr_intro_2.html) | The multi-country / local area / branch structure; "car models are grouped into car groups; all cars in a car group have the same rental tariff" (R01, R17); "cars are serviced at 5.000 miles intervals" (R14); the at-most-three-additional-drivers rule (R03) |
| [EU-Rent Car (SBVR) — Caminao's Ways](https://caminao.blog/community/sample-problems/eu-rent-car/) | Car ownership at local-area level with storage at branches; advance vs walk-in and one-way rentals; the bad-experience kinds and the authority to bar drivers (R04, R19); the core vocabulary list |
| [SBVR Speaks on Rules: Violations of Business Rules — Business Rules Journal](https://www.brcommunity.com/articles.php?id=c009) | **R10 and R11 verbatim**, and the behavioural-rule / remedial-rule distinction that shapes how the twenty rules are classified in RULES.md |
| [Rental Car Age Requirements — Auto Europe](https://www.autoeurope.com/travel-tips/rental-car-age-requirements/) | Corroboration only, for the assumed minimum driver age in R06 |

## Where the model goes beyond the sources

Three thresholds are **assumed**, because the published material states the shape of the rule
without a number: the minimum driver age of 21 (R06), the 90-day maximum rental period (R07),
and the three bad experiences that bar a driver (R19). Each says so in its own annotation and
each is a question on the project todo list.

Two structures are **modelling choices**, not statements of the case: the Person supertype
with Customer and Driver subtypes (the sources treat renter and driver as separate roles but
do not say how to type them), and the rental life cycle as a state machine (the sources speak
of open, cancelled and closed rentals without giving a transition diagram).

The Business Rules Group's own EU-Rent material and the OMG SBVR annex contain considerably
more rules than the twenty modelled here — the annex runs to roughly a hundred. The twenty
were chosen to cover each *kind* of rule once: structural, behavioural, remedial, derivation,
cardinality, and a join constraint.
