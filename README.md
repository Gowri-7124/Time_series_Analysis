# Time Series Analysis and Sales Forecasting

A retail sales analytics project that explores historical store sales
and forecasts future sales using Python time-series models. The project
combines data preparation, trend visualization, forecasting, SQL data
handling, and business intelligence reporting.

## Project Objectives

-   Analyze historical daily retail sales.
-   Explore sales patterns over time and across stores.
-   Prepare date-based features for analysis.
-   Forecast the next 30 days of sales for a selected store.
-   Support business planning through SQL and dashboard-based reporting.

## Tools and Technologies

-   **Python** --- analysis and forecasting
-   **Pandas, NumPy** --- data loading and preprocessing
-   **Matplotlib, Seaborn** --- data visualization
-   **Prophet** --- time-series forecasting
-   **Statsmodels (ARIMA)** --- statistical forecasting
-   **PostgreSQL** --- storing and querying sales data
-   **Power BI** --- dashboarding and business insights
-   **Jupyter Notebook** --- development environment

## Dataset

The project uses `store_sales.csv`. The columns used in the workflow
include:

  Column      Description
  ----------- ------------------------------------
  `date`      Date of the sales record
  `store`     Store identifier
  `sales`     Sales value for the store and date
  `promo`     Promotion indicator
  `holiday`   Holiday indicator

The notebook also derives date-based features such as `dayofweek`,
`month`, and `year`.

> Place `store_sales.csv` in your working directory, or update the file
> path in the notebook to match your computer.

## Workflow

1.  **Load and prepare data**\
    Load the CSV with the date column parsed as a datetime value, sort
    records by store and date, and derive calendar features.

2.  **Explore sales trends**\
    Aggregate sales by date and plot total daily sales to observe
    changes over time.

3.  **Forecast with Prophet**\
    Select Store 1 and format its date and sales columns as `ds` and
    `y`, as required by Prophet. Fit the model and generate a 30-day
    forecast.

4.  **Forecast with ARIMA**\
    Fit an ARIMA model with order `(1, 1, 1)` to Store 1 sales and
    forecast the next 30 steps.

5.  **SQL and dashboard analysis**\
    PostgreSQL can be used to store and query the sales table, while
    Power BI can present sales KPIs and trends in an interactive
    dashboard.

## Setup

Install the Python libraries:

``` bash
pip install pandas numpy matplotlib seaborn statsmodels prophet jupyter
```

Make sure PostgreSQL and Power BI are installed separately if you want
to use the database and dashboard workflow.

## Run the Notebook

1.  Download or clone this repository.
2.  Place `store_sales.csv` in the project folder.
3.  Open `Time_series_project(1).ipynb` in Jupyter Notebook or
    JupyterLab.
4.  Update the CSV path in the notebook if needed.
5.  Run the cells in order to view the sales trend and forecasting
    outputs.

## Forecasting Models

-   **Prophet:** uses the date (`ds`) and sales (`y`) series to generate
    a forecast and visualization.
-   **ARIMA:** uses the Store 1 sales series with model order
    `(1, 1, 1)` to forecast 30 future steps.

## Current Scope and Future Improvements

The notebook demonstrates forecasting and plots the model outputs.
Before using forecasts for business decisions, evaluate model
performance on a held-out test period using metrics such as MAE and
RMSE, and compare the Prophet and ARIMA results. Further improvements
could include incorporating promotion and holiday effects into the
models, adding forecasts for multiple stores, and documenting the Power
BI dashboard screenshots.

## Disclaimer

Forecasts are estimates based on historical patterns and should not be
treated as guaranteed future sales.
