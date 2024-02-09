using { capm1_computerShop_batch3.db as db } from '../db/data-model';

service CatalogService
{
    entity Computers as
        projection on db.Computers;

    @odata.draft.enabled : false
    entity Customers as
        projection on db.Customers;

    @odata.draft.enabled
    entity Sales as
        projection on db.Sales;

    @readonly
    entity sales_overview as
        projection on db.sales_overview;
}
