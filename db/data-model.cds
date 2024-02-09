namespace capm1_computerShop_batch3.db;

using { managed } from '@sap/cds/common';

entity Computers
{
    key ID : Integer;
    name : String;
    model : String;
    unitprice : Integer;
    stock : Integer;
}

entity Customers
{
    key ID : Integer;
    name : String(100);
    address : String(100);
    phone : String(100);
}

entity Sales : managed
{
    key ID : UUID;
    customerID : Integer;
    computerID : Integer;
    price : Decimal;
}

/**
 * Aspect to capture changes by user and name
 * 
 * See https://cap.cloud.sap/docs/cds/common#aspect-managed
 */
entity sales_overview as
    select key sal.ID as salesID,
    sal.customerID as customerID,
    cust.name as customerName,
    cust.phone as customerPhone,
    cust.address as customerAddress,
    com.ID as computerID,
    com.name as compuerName,
    sal.price as salesAmount
    from Sales as sal
    left join Customers as cust
        on sal.customerID = cust.ID
    left join Computers as com
        on sal.computerID = com.ID;
