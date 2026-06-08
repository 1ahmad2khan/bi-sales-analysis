Retail Sales Analysis

A business intelligence project exploring sales performance across products, 
regions and time periods. The goal is to surface actionable insights from 
transactional data — the kind of analysis that typically sits behind a 
weekly trading report or a quarterly business review.

 Background

Retail businesses generate large volumes of transactional data but often 
struggle to turn it into clear decisions. This project works through that 
problem using a structured BI workflow: starting with raw data, moving 
through cleaning and exploration, and ending with a set of findings a 
stakeholder could act on.

 Questions I wanted to answer

- Where is revenue actually coming from — which products, categories and regions?
- Are there seasonal patterns that the business should be planning around?
- Which areas are underperforming relative to the rest, and what might explain that?

 Tools used

- Python and Pandas for data cleaning and exploration
- SQL for querying and aggregating the data
- Matplotlib and Seaborn for visualisations
- Power BI for the interactive dashboard (see dashboard/sales_dashboard.pbix)

 Folder structure

    data/          raw and cleaned datasets
    notebooks/     Python analysis
    sql/           queries used in the project
    dashboard/     charts and dashboard exports
    docs/          written findings and recommendations

 Key Findings

- Revenue has grown consistently from 2015 to 2018
- September and November are peak sales months every year
- Technology is the top performing category at ~$830,000
- The South region underperforms significantly vs other regions
- The Canon imageCLASS 2200 Copier is the standout product at ~$61,000

Full findings and recommendations are in the [business report](docs/business_report.md)

An interactive Power BI dashboard is available in the dashboard folder, 
covering revenue KPIs, category performance, regional breakdown and top 
products.