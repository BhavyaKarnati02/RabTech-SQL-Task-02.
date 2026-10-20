# RabTech Academy — Task 02 Submission

## Files
1. `01_create_tables.sql` — schema creation for SQL Server.
2. `02_seed_data.sql` — sample data and verification queries.
3. `03_negative_tests.sql` — tests for CHECK, FOREIGN KEY, and PRIMARY KEY constraints.
4. `04_business_rule_matrix.md` — business rules mapped to constraints.
5. `05_er_diagram.md` — ER diagram and relationship explanation.

## Run in SSMS
1. Open each `.sql` file in SSMS and run them in order.
2. The seed script should show four customers and six orders for the supplied fixture.
3. Run the negative tests and check the Messages tab for five `PASS` lines.
4. Capture screenshots of the query output and test messages if the portal requests execution proof.

## Accuracy note
These scripts are adapted for Microsoft SQL Server Express because that was the available local database. Do not claim they were run in PostgreSQL. If the portal explicitly requires PostgreSQL-only evidence, state the environment limitation honestly.

## Final checklist
- [ ] Verify customer and order counts.
- [ ] Run all negative tests and capture the PASS messages.
- [ ] Include the business-rule matrix and ER diagram.
- [ ] Follow the internship portal's file and naming requirements.
