# Social Media Analytics

A SQL Server and Power BI project analysing post engagement across six synthetic Instagram-style accounts.

**Data note:** All data is synthetic and created for practice. It is not from real accounts.

## Tools

SQL Server (T-SQL, window functions), Power BI, DAX

## What's in the repo

- `sql/`: schema, data, the snapshot view, and five analysis queries
- `powerbi/`: the dashboard file (3 pages)
- `screenshots/`: dashboard and query output

## Key techniques

- RANK, LAG, LEAD window functions
- A view that keeps the latest engagement snapshot per post, to avoid double-counting
- A date dimension connected to engagement and follower data

## Insights

- Fashion accounts have the highest total engagement score
- Food posts have the highest average score per post
- Followers rise steadily across the three days in the dataset