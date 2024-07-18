# Nike_Exploratory_Data_Analysis

This project involves analyzing Nike product orders to derive valuable insights into order completion rates. By addressing four key questions, the project aims to provide a comprehensive understanding of order item completion rates by product and age group. Each question is answered using specific SQL queries, and the results are presented in a clear and structured manner. 
An index.html file is included for easy navigation through the questions and their corresponding analyses.

## Dataset overview:

[This database](postgres://Test:bQNxVzJL4g6u@ep-noisy-flower-846766.us-east-2.aws.neon.tech/SQL_2_3) contains data about the e-commerce business of Nike. The database includes four different tables that include information about online orders, products, and distribution of the products.

## Tables

### Orders

| Column Name  | Data Type | Description                                            |
| ------------ | --------- | ------------------------------------------------------ |
| order_id     | text      | Unique identifier of the order                         |
| user_id      | text      | Unique identifier of the customer purchasing the order |
| status       | text      | Current status of the order                            |
| gender       | text      | Gender of the customer purchasing the order            |
| created_at   | date      | Date of when the order got created                     |
| returned_at  | date      | Date of when the order got returned                    |
| shipped_at   | date      | Date of when the order got shipped                     |
| delivered_at | date      | Date of when the order got delivered                   |

### Order Items

| Column Name   | Data Type | Description                                            |
| ------------- | --------- | ------------------------------------------------------ |
| order_item_id | text      | Unique identifier of the order item                    |
| order_id      | text      | Unique identifier of the order                         |
| user_id       | text      | Unique identifier of the customer purchasing the order |
| product_id    | text      | Unique identifier of the product                       |
| created_at    | date      | Date of when the order item got created                |
| shipped_at    | date      | Date of when the order item got shipped                |
| delivered_at  | date      | Date of when the order item got delivered              |
| returned_at   | date      | Date of when the order item got returned               |
| sale_price    | float     | The sales price of the product part of the order item  |

### Order Items Vintage

| Column Name   | Data Type | Description                                            |
| ------------- | --------- | ------------------------------------------------------ |
| order_item_id | text      | Unique identifier of the order item                    |
| order_id      | text      | Unique identifier of the order                         |
| user_id       | text      | Unique identifier of the customer purchasing the order |
| product_id    | text      | Unique identifier of the product                       |
| created_at    | date      | Date of when the order item got created                |
| shipped_at    | date      | Date of when the order item got shipped                |
| delivered_at  | date      | Date of when the order item got delivered              |
| returned_at   | date      | Date of when the order item got returned               |
| sale_price    | float     | The sales price of the product part of the order item  |

### Products

| Column Name            | Data Type | Description                                    |
| ---------------------- | --------- | ---------------------------------------------- |
| product_id             | text      | Unique identifier of the product               |
| cost                   | float     | The cost price of the product                  |
| category               | text      | The category that the product is part of       |
| product_name           | text      | Name of the product                            |
| retail_price           | text      | Retail price of the product without discount   |
| sku                    | text      | Stock keeping unit code for inventory manageme |
| distribution_center_id | text      | Unique identifier of the distribution center   |

### Distribution Centers

| Column Name            | Data Type | Description                                   |
| ---------------------- | --------- | --------------------------------------------- |
| distribution_center_id | text      | Unique identifier of the distribution center  |
| name                   | text      | Name of the distribution center               |
| latitude               | float     | Latitude of the distribution center location  |
| longitude              | float     | Longitude of the distribution center location |
