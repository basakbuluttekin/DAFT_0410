       
use lab_mysql;
CREATE TABLE cars (
                                                id int(10),
                                                VIN text,
                                                manufacturer text,
                                                model text,
                                                year INT(4),
                                                colour text,
                                                PRIMARY KEY (id)); 
                                                
                                                
CREATE TABLE customers (
                                                id int(10),
                                                customer_id text,
                                                name text,
                                                phone_number text,
                                                Email text,
                                                address text,
                                                city text,
                                                state text,
                                                country text,
                                                postal_code INT(10));
                                                
  CREATE TABLE salesperson (
                                                id int(10),
                                                staff_id VARCHAR(10),
                                                name text,
                                                store text);
                                                                                           
                                                
  CREATE TABLE invoices (
                                                id int(10),
                                                invoice_number VARCHAR(10),
                                                date DATE,
                                                car int(10),
                                                customer text,
                                                salesperson VARCHAR(10));
                                                                                
                                                