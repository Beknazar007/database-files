-- Create the acweb Database and Restore Its Backup
-- Change to the postgres user:
sudo su - postgres
-- Create the database to be restored:
createdb acweb
-- Download the backup from GitHub:
wget https://github.com/linuxacademy/content-postgresql-deepdive/raw/master/acweb/acweb.tar
-- Use pg_restore to restore the backup:
pg_restore --dbname=acweb --verbose /var/lib/pgsql/acweb.tar
-- Launch psql and verify the data is present:
psql
-- List the databases with
\l
-- Connect to acweb:
\c acweb
-- Get a count for the payment table:
SELECT COUNT(*) FROM sales.payment;
-- We should have a count of 1000.
-- Create the Table payment_audit
-- Use the following query to create the table:
CREATE TABLE payment_audit (
   payment_id INTEGER,
   customer_id INTEGER,
   amount numeric(6,2),
   payment_date timestamp without time zone NOT NULL,
   username VARCHAR(20),
   delete_date TIMESTAMP
);
-- Create the Trigger and Function audit_payment_deletes
-- Use the following query to create the needed function:
CREATE FUNCTION audit_payment_deletes() RETURNS trigger AS $$
   BEGIN
      INSERT INTO payment_audit VALUES((OLD).*, current_user, current_timestamp);
      RETURN OLD;
   END;
$$ LANGUAGE plpgsql;
-- Use the following query to create a trigger to call this function:
CREATE TRIGGER audit_payment_deletes
BEFORE DELETE ON sales.payment
FOR EACH ROW
EXECUTE PROCEDURE audit_payment_deletes();
-- Create the View "customer_addresses"
-- Use the following query to create the view:
CREATE VIEW sales.customer_addresses AS
   SELECT c.first_name, c.last_name , a.address, ct.name as city, s.name as state, a.postal_code
   FROM sales.customer c
   LEFT JOIN sales.address a on c.addr_id = a.addr_id
   LEFT JOIN sales.city ct on a.city_id = ct.city_id
   LEFT JOIN sales.state s on ct.state_id = s.state_id;
-- Run Payments From Mick Fowler
-- Query the sales.customer to find the ID for Mick Fowler:
SELECT * FROM sales.customer
WHERE first_name = 'Mick'
AND last_name = 'Fowler';
-- Using the ID, insert five payments from Mick as directed in the instructions:

INSERT INTO sales.payment (customer_id, amount, payment_date)
VALUES (303, 10, current_timestamp);

INSERT INTO sales.payment (customer_id, amount, payment_date)
VALUES (303, 20, current_timestamp);

INSERT INTO sales.payment (customer_id, amount, payment_date)
VALUES (303, 30, current_timestamp);

INSERT INTO sales.payment (customer_id, amount, payment_date)
VALUES (303, 40, current_timestamp);

INSERT INTO sales.payment (customer_id, amount, payment_date)
VALUES (303, 50, current_timestamp);
-- Change Mick's $30 payment to $15:

UPDATE sales.payment
SET amount = 15
WHERE customer_id = 303
AND amount = 30;
-- Delete all of Mick's payments that are greater than $20:
DELETE FROM sales.payment
WHERE customer_id = 303
AND amount > 20;
-- Verify That Everything Works As Expected
-- Turn on Expanded Display:
\x
-- Query the customer_addresses view to make sure that the first name, last name, address, city, state, and zip code are displayed:
SELECT * FROM sales.customer_addresses;
-- Review the payment_audit table. You should see Mick's payments for $40 and $50 listed:
SELECT * FROM payment_audit;
-- Conclusion
-- Congratulations on completing this hands-on lab!