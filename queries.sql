-- ============================================================
-- Ecommerce Service Operations Database
-- Queries: business questions answered with SQL
-- Domain: Retail, post-sale service management
-- ============================================================

USE furniture_ops;

-- Q1. Show all service cases currently Awaiting Parts
SELECT *
FROM service_requests
WHERE status = 'Awaiting Parts'


-- Q2. Show Pending Outside Tech cases with customer name
SELECT
    C.full_name,
    SR.ticket_number,
    SR.product_type,
    SR.status
FROM customers C
JOIN service_requests SR ON C.customer_id = SR.customer_id
WHERE SR.status = 'Pending Outside Tech'


-- Q3. Find customers with no email address on file
SELECT *
FROM customers
WHERE email IS NULL;


-- Q4. Show all Scheduled appointments ordered by date
SELECT
    C.full_name,
    SR.ticket_number,
    SR.product_type,
    SR.status,
    SR.scheduled_date
FROM customers C
JOIN service_requests SR ON C.customer_id = SR.customer_id
WHERE SR.status = 'Scheduled'
ORDER BY SR.scheduled_date;


-- Q5. Find all open cases with no scheduled date yet
SELECT *
FROM service_requests
WHERE scheduled_date IS NULL
AND status != 'Completed';


-- Q6. Show all open cases assigned to Diana Reyes
SELECT
    C.full_name,
    SR.ticket_number,
    SR.product_type,
    SR.status
FROM customers C
JOIN service_requests SR ON C.customer_id = SR.customer_id
WHERE SR.assigned_to = 'Diana Reyes'
AND SR.status != 'Completed';
