
## Content

- Starwar API [Link](https://swapi.dev/api/people/)
  - from `requests` import `get`
  - from `time` import `sleep`
  - import `csv` to write file

- Pandas and Numpy Foundation [Link](https://datalore.jetbrains.com/report/static/pHbTq7wr8heYWi8OLigpk8/bF1h9Wzln0suEKpu02Wr4Q)
  - Working with Date and Time : `.to_datetime`
  - Count rows `df.sahpe[0]` and count columns `df.shape[1]`
  - Slicing interested data : `df.iloc[0:8, 4]`, `df[(df['Order Date'] >= "2019-01-01 00:00:00") & (df['Order Date'] < "2020-01-01 00:00:00")]`, `df[['Order Date','Ship Date']]` etc.
  - Tackle with missing values: `is.na()`
  - Sort value: `.sort_values()`
  - Aggregate and summarize data such as `.groupby("Segment")["Profit"].sum()` and `.agg(["sum", "mean", "std"])`
  - Export data: `reset_index` and `.to_csv`
  - Simple plotting: `.plot(x, y, kind)`
  - Use Numpy `np.where()` to create new column in dataframe to help answer a question
