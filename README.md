# Analyzing-Carbon-Footprints
# Analyzing Carbon Footprints in SQL

_Greenhouse gas emissions attributable to products - from food to sneakers to appliances - make up more than 75% of global emissions._

The Carbon Catalogue, carbon footprints of 866 commercial products from 8 industry sectors and 5 continents. 
Cite: [The Carbon Catalogue](https://www.nature.com/articles/s41597-022-01178-9)

The dataset is publicly availably on [nature.com](https://www.nature.com/articles/s41597-022-01178-9) and stores product carbon footprints (PCFs) for various companies. PCFs are the greenhouse gas emissions attributable to a given product, measured in CO<sub>2</sub> (carbon dioxide equivalent). Product carbon footprints (PCFs) are playing an increasing role in decisions around sustainability for companies and consumers.
Based on data reported to CDP, a dataset of 866 PCFs was previously built, incorporating information from 145 companies, 30 industry groups, and 28 countries. Trends were shown in how upstream and downstream emissions vary by industry, and how life cycle assessment (LCA) is associated with steeper carbon reductions achieved through improvements across a product’s value chain.

## Connecting data

### Set up connection

- Use the following credentials:
    + Integration name: SQL Carbon Emissions
    + Port: 5432
    + Hostname: workspacedemodb.datacamp.com
    + Database: emissions
    + Username: emissions_codealong
    + Password: emissions_codealong

## Database

This database contains only one table, which looks at PCFs by product as well as the stage of production these emissions occured in.

### `product_emissions`

| field                              | data_type |
|------------------------------------|-----------|
| id                                 | VARCHAR   |
| year                               | INT       |
| product_name                       | VARCHAR   |
| company                            | VARCHAR   |
| country                            | VARCHAR   |
| industry_group                     | VARCHAR   |
| weight_kg                          | NUMERIC   |
| carbon_footprint_pcf               | NUMERIC   |
| upstream_percent_total_pcf         | VARCHAR   |
| operations_percent_total_pcf       | VARCHAR   |
| downstream_percent_total_pcf       | VARCHAR   |

### A little background:
- Upstream emissions - `upstream_percent_total_pcf`: emissions that occur before the company's own operations such as emissions created by manufacturing bottles that Coke buys from suppliers
- Operations emissions - `operations_percent_total_pcf`: emissions that the company creates directly, such as when Coke is bottling its product
- Downstream emissions - `downstream_percent_total_pcf`: emissions that occur after the product leaves the company, such as after Coke has sold drinks to McDonald's

Have you ever wondered about the carbon footprint of your jeans or soft drink? In this project, I use SQL  and Python to explore product carbon footprints in different countries and companies.

Understanding emissions along a product’s lifecycle is important to achieving the steep carbon reductions required to meet global carbon goals.

Key Takeaways:
- Filter data to spotlight information of interest
- Calculate metrics to summarize data
- Analyze and visualize data changes