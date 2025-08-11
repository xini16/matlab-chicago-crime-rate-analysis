# matlab-chicago-crime-rate-analysis
A course project that analyzes **11 years of Chicago crime data (2013–2023)** to uncover temporal and spatial patterns and to **forecast 2024**. Completed for *Intro to Computers & Programming* (final grade: **A**).

---

## Highlights
- **Time-series trends**: yearly counts and within-year accumulation patterns.
- **COVID-19 impact**: visible dip in 2020–2021 and rebound in 2022–2023.
- **Category breakdown**: distribution by primary crime type; 2023 description word cloud.
- **Geospatial insights**: hotspots by district; density overlay with community boundaries.
- **Arrest-rate trend**: decline from ~2013–2014 to 2022–2023.
- **Forecast**: simple projection for **2024** based on historical patterns.

---

## Tech Stack
- **Language**: MATLAB (R2022b+ recommended)
- **Toolboxes (recommended)**: Statistics and Machine Learning; (optional) Mapping
- **Data**: Chicago Data Portal — “Crimes - 2001 to Present”

---

## Repository Structure
├── data/
│ └── chicago_crimes_2013_2023.csv # raw CSV (filtered to 2013–2023)
├── scripts/
│ ├── main.m # one-click runner
│ ├── load_data.m # read & initial parse
│ ├── clean_data.m # missing values, types, dedup
│ ├── analyze_time_series.m # yearly & monthly accumulation
│ ├── analyze_categories.m # type distribution & wordcloud
│ ├── analyze_geography.m # hotspots & density maps
│ ├── analyze_arrest_rate.m # arrest ratio by year
│ ├── forecast_2024.m # simple trend-based projection
│ └── plot_utils.m # common plotting helpers
├── figures/ # generated charts saved here
│ ├── yearly_trends.png
│ ├── monthly_accumulation.png
│ ├── forecast_2024.png
│ ├── crime_types.png
│ ├── wordcloud_2023.png
│ ├── district_hotspots_2023.png
│ ├── density_2023.png
│ └── arrest_rate.png
└── README.md

markdown
复制
编辑

---

## Data Source
- **Chicago Data Portal**: *Crimes - 2001 to Present*  
  Download and filter to `2013-01-01` ~ `2023-12-31`.  
  Suggested columns:
  `Date`, `Primary Type`, `Description`, `Arrest`, `Community Area`,
  `District`, `Latitude`, `Longitude`.

Save as:
data/chicago_crimes_2013_2023.csv

yaml
复制
编辑

---

## Getting Started

### 1) Clone
```bash
git clone https://github.com/<your-username>/chicago-crime-analysis.git
cd chicago-crime-analysis
2) Put data
Place the filtered CSV into data/ as chicago_crimes_2013_2023.csv.

3) Run in MATLAB
Open the folder in MATLAB and run:

matlab
复制
编辑
main
All figures will be exported to figures/.

Methods (Brief)
Time Series: aggregate by year and by month; plot yearly totals and average monthly accumulation.

Forecasting: simple linear / trend-based projection for 2024 accumulated counts (illustrative).

Categories: frequency of Primary Type; 2023 Description word cloud.

Geospatial: district-level bubble map and KDE/density map (uses geoscatter/geoplot if available).

Arrest Rate: (#Arrest==true) / (#TotalCrimes) by year.

Note: This is an educational project—models are intentionally simple for interpretability and reproducibility.

Sample Results (from this repo’s outputs)
Yearly Trends (2013–2023): overall decline after 2014; sharp dip in 2020–2021; rebound in 2022–2023.

Crime Types: theft leads; battery/assault also prominent.

Geospatial: central & selected southern areas show higher density.

Arrest Rate: general downward trend across the decade.

2024 Forecast: continuation of recent post-pandemic pattern (slight increase vs. 2023).

(See figures/ for charts: yearly_trends.png, crime_types.png, density_2023.png, arrest_rate.png, forecast_2024.png.)

Reproducibility Notes
MATLAB version differences may slightly alter visuals.

Randomness is not used except for any sampling demos (seed fixed where applicable).

If Mapping Toolbox isn’t available, geospatial plots gracefully fall back to scatter on lat/lon.

License
MIT — see LICENSE.
