CREATE DATABASE SocialMediaAnalytics;
GO

USE SocialMediaAnalytics;
GO

DROP TABLE IF EXISTS Engagement;
DROP TABLE IF EXISTS FollowerHistory;
DROP TABLE IF EXISTS Posts;
DROP TABLE IF EXISTS Accounts;
GO

CREATE TABLE Accounts (
    AccountID    INT IDENTITY(1,1) PRIMARY KEY,
    AccountName  NVARCHAR(100) NOT NULL,
    Username     NVARCHAR(100) NOT NULL UNIQUE,
    Followers    INT NOT NULL DEFAULT 0,
    CreatedDate  DATE NOT NULL,
    Account_Type NVARCHAR(50)
);

CREATE TABLE Posts (
    PostID       INT IDENTITY(1,1) PRIMARY KEY,
    AccountID    INT NOT NULL FOREIGN KEY REFERENCES Accounts(AccountID),
    PostDate     DATETIME NOT NULL,
    PostTime     TIME NOT NULL,
    PostContent  NVARCHAR(2200),
    Hashtags     NVARCHAR(500),
    PostedHour   INT
);

CREATE TABLE Engagement (
    EngagementID   INT IDENTITY(1,1) PRIMARY KEY,
    PostID         INT NOT NULL FOREIGN KEY REFERENCES Posts(PostID),
    Likes          INT NOT NULL DEFAULT 0,
    Comments       INT NOT NULL DEFAULT 0,
    Shares         INT NOT NULL DEFAULT 0,
    Saves          INT NOT NULL DEFAULT 0,
    EngagementDate DATETIME NOT NULL
);

CREATE TABLE FollowerHistory (
    FollowerHistoryID INT IDENTITY(1,1) PRIMARY KEY,
    AccountID         INT NOT NULL FOREIGN KEY REFERENCES Accounts(AccountID),
    FollowerCount     INT NOT NULL,
    RecordedDate      DATETIME NOT NULL
);

CREATE INDEX idx_Posts_AccountID ON Posts(AccountID);
CREATE INDEX idx_Engagement_PostID ON Engagement(PostID);
CREATE INDEX idx_FollowerHistory_AccountID ON FollowerHistory(AccountID);
GO

INSERT INTO Accounts (AccountName, Username, Followers, CreatedDate, Account_Type) VALUES
    ('Fitness Hub Demo',      '@demo_fit_hyd',        145000, '2021-02-15', 'Fitness'),
    ('Fashion Style Demo',    '@demo_style_lab',      287000, '2020-08-22', 'Fashion'),
    ('Gadget Reviews Demo',   '@demo_tech_reviews',    98500, '2022-11-10', 'Tech'),
    ('Food Kitchen Demo',     '@demo_food_kitchen',   156000, '2021-05-18', 'Food'),
    ('Wellness Coach Demo',   '@demo_wellness_coach',  92000, '2022-03-12', 'Fitness'),
    ('Ethnic Wear Demo',      '@demo_ethnic_wear',    178000, '2021-09-05', 'Fashion');

INSERT INTO Posts (AccountID, PostDate, PostTime, PostContent, Hashtags, PostedHour) VALUES
    (1, '2024-07-01 08:30:00', '08:30:00', 'HIIT workout routine for fat burning at home', '#fitnessmotivation #hiitworkout #homegym #fitnessgains', 8),
    (1, '2024-07-01 18:45:00', '18:45:00', 'Evening running session tips and tricks', '#running #outdoorfitness #marathontraining #fitnessguru', 18),
    (1, '2024-07-02 07:00:00', '07:00:00', 'Morning yoga flow for beginners complete guide', '#yoga #flexibility #yogaforbeginners #morningroutine', 7),
    (2, '2024-07-01 14:20:00', '14:20:00', 'Monsoon fashion trends 2024 ethnic wear edition', '#monsoonlook #ethnicfashion #fashiontrends #styleinspo', 14),
    (2, '2024-07-02 10:15:00', '10:15:00', 'Summer collection launch new arrivals exclusive', '#fashionnewseason #summercollection #newlaunch #boutique', 10),
    (2, '2024-07-03 19:30:00', '19:30:00', 'Casual dinner outfit styling complete makeover', '#casualwear #outfitoftheday #fashionblogger #styling', 19),
    (3, '2024-07-01 12:00:00', '12:00:00', 'iPhone 15 Pro Max vs Samsung S24 camera battle', '#iphonevsandroid #techcomparison #camerareview #gadgets', 12),
    (3, '2024-07-02 15:45:00', '15:45:00', 'MacBook Pro M3 unboxing first impressions review', '#apple #macbook #unboxing #techreview', 15),
    (4, '2024-07-01 11:30:00', '11:30:00', 'Authentic biryani recipe step by step tutorial easy', '#indianfood #biryani #recipes #homecooking', 11),
    (4, '2024-07-03 13:00:00', '13:00:00', 'Eggless chocolate brownies dessert tutorial baking', '#desserts #baking #chocolaterecipe #recipevideo', 13);

INSERT INTO Engagement (PostID, Likes, Comments, Shares, Saves, EngagementDate) VALUES
    (1,  4500,  230, 125,  890, '2024-07-01 12:00:00'),
    (1,  5200,  310, 150, 1100, '2024-07-02 12:00:00'),
    (1,  5800,  420, 180, 1250, '2024-07-03 12:00:00'),
    (2,  3800,  180,  85,  650, '2024-07-02 12:00:00'),
    (2,  4200,  220, 100,  780, '2024-07-03 12:00:00'),
    (3,  6200,  510, 250, 1450, '2024-07-03 12:00:00'),
    (4,  8900,  670, 340, 2100, '2024-07-02 12:00:00'),
    (4, 10500,  890, 450, 2800, '2024-07-03 12:00:00'),
    (5,  7500,  450, 280, 1650, '2024-07-03 12:00:00'),
    (6,  6400,  380, 220, 1400, '2024-07-04 12:00:00'),
    (7,  6200,  510, 250, 1450, '2024-07-01 12:00:00'),
    (7,  6900,  560, 290, 1600, '2024-07-02 12:00:00'),
    (8,  4800,  300, 140,  900, '2024-07-02 12:00:00'),
    (8,  5100,  330, 160,  980, '2024-07-03 12:00:00'),
    (9,  7200,  420, 210, 1300, '2024-07-01 12:00:00'),
    (9,  7800,  460, 240, 1400, '2024-07-02 12:00:00'),
    (10, 9100,  600, 300, 1900, '2024-07-03 12:00:00'),
    (10, 9600,  640, 330, 2000, '2024-07-04 12:00:00');

INSERT INTO FollowerHistory (AccountID, FollowerCount, RecordedDate) VALUES
    (1, 142000, '2024-07-01'), (1, 143500, '2024-07-02'), (1, 145000, '2024-07-03'),
    (2, 284000, '2024-07-01'), (2, 285500, '2024-07-02'), (2, 287000, '2024-07-03'),
    (3,  96500, '2024-07-01'), (3,  97500, '2024-07-02'), (3,  98500, '2024-07-03'),
    (4, 153500, '2024-07-01'), (4, 154750, '2024-07-02'), (4, 156000, '2024-07-03'),
    (5,  90000, '2024-07-01'), (5,  91000, '2024-07-02'), (5,  92000, '2024-07-03'),
    (6, 175000, '2024-07-01'), (6, 176500, '2024-07-02'), (6, 178000, '2024-07-03');
GO


USE SocialMediaAnalytics;
GO

CREATE OR ALTER VIEW vw_LatestPostEngagement AS
WITH RankedSnapshots AS (
    SELECT
        E.PostID, E.Likes, E.Comments, E.Shares, E.Saves, E.EngagementDate,
        ROW_NUMBER() OVER (PARTITION BY E.PostID ORDER BY E.EngagementDate DESC) AS SnapshotNo
    FROM Engagement E
)
SELECT
    A.Username,
    A.Account_Type,
    P.PostID,
    P.PostContent,
    P.PostedHour,
    R.Likes,
    R.Comments,
    R.Shares,
    R.Saves,
    (R.Likes + R.Comments*2 + R.Shares*3 + R.Saves) AS TotalEngagementScore
FROM RankedSnapshots R
INNER JOIN Posts P    ON R.PostID = P.PostID
INNER JOIN Accounts A ON P.AccountID = A.AccountID
WHERE R.SnapshotNo = 1;
GO

SELECT * FROM vw_LatestPostEngagement ORDER BY TotalEngagementScore DESC;



SELECT
    A.Username,
    A.Account_Type,
    P.PostContent,
    E.Likes,
    E.Comments,
    E.Shares,
    E.Saves,
    (E.Likes + E.Comments*2 + E.Shares*3 + E.Saves) AS TotalEngagementScore,
    RANK() OVER (PARTITION BY A.AccountID ORDER BY (E.Likes + E.Comments*2 + E.Shares*3 + E.Saves) DESC) AS RankWithinAccount,
    RANK() OVER (ORDER BY (E.Likes + E.Comments*2 + E.Shares*3 + E.Saves) DESC) AS OverallRank
FROM Posts P
INNER JOIN Accounts A ON P.AccountID = A.AccountID
INNER JOIN Engagement E ON P.PostID = E.PostID
ORDER BY TotalEngagementScore DESC;



SELECT
    A.Username,
    P.PostID,
    P.PostContent,
    E.EngagementDate,
    E.Likes AS CurrentLikes,
    LAG(E.Likes)  OVER (PARTITION BY P.PostID ORDER BY E.EngagementDate) AS PreviousDayLikes,
    E.Likes - LAG(E.Likes) OVER (PARTITION BY P.PostID ORDER BY E.EngagementDate) AS DailyGain,
    LEAD(E.Likes) OVER (PARTITION BY P.PostID ORDER BY E.EngagementDate) AS NextDayLikes
FROM Engagement E
INNER JOIN Posts P    ON E.PostID = P.PostID
INNER JOIN Accounts A ON P.AccountID = A.AccountID
ORDER BY P.PostID, E.EngagementDate;



SELECT
    V.Account_Type,
    V.PostedHour,
    COUNT(V.PostID) AS TotalPosts,
    ROUND(AVG(CAST(V.Likes AS FLOAT)), 2) AS AvgLikes,
    ROUND(AVG(CAST(V.Comments AS FLOAT)), 2) AS AvgComments,
    ROUND(AVG(CAST(V.TotalEngagementScore AS FLOAT)), 2) AS AvgEngagementScore,
    RANK() OVER (
        PARTITION BY V.Account_Type
        ORDER BY AVG(CAST(V.TotalEngagementScore AS FLOAT)) DESC
    ) AS BestHourRank
FROM vw_LatestPostEngagement V
GROUP BY V.Account_Type, V.PostedHour
ORDER BY V.Account_Type, BestHourRank;


WITH HashtagSplit AS (
    SELECT
        P.PostID,
        LTRIM(RTRIM(value)) AS Hashtag
    FROM Posts P
    CROSS APPLY STRING_SPLIT(P.Hashtags, ' ')
    WHERE LTRIM(RTRIM(value)) <> ''
)
SELECT
    V.Account_Type,
    H.Hashtag,
    COUNT(DISTINCT V.PostID) AS PostsUsingTag,
    ROUND(AVG(CAST(V.TotalEngagementScore AS FLOAT)), 2) AS AvgEngagement,
    RANK() OVER (
        PARTITION BY V.Account_Type
        ORDER BY AVG(CAST(V.TotalEngagementScore AS FLOAT)) DESC
    ) AS HashtagRank
FROM HashtagSplit H
INNER JOIN vw_LatestPostEngagement V ON H.PostID = V.PostID
GROUP BY V.Account_Type, H.Hashtag
ORDER BY V.Account_Type, HashtagRank;



WITH AccountStats AS (
    SELECT
        Account_Type,
        COUNT(*) AS TotalAccounts,
        AVG(CAST(Followers AS FLOAT)) AS AvgFollowers
    FROM Accounts
    GROUP BY Account_Type
),
PostStats AS (
    SELECT
        Account_Type,
        COUNT(PostID) AS TotalPosts,
        AVG(CAST(Likes AS FLOAT)) AS AvgLikes,
        AVG(CAST(TotalEngagementScore AS FLOAT)) AS AvgEngagementScore
    FROM vw_LatestPostEngagement
    GROUP BY Account_Type
)
SELECT
    S.Account_Type,
    S.TotalAccounts,
    ROUND(S.AvgFollowers, 2) AS AvgFollowers,
    ISNULL(P.TotalPosts, 0) AS TotalPosts,
    ROUND(P.AvgLikes, 2) AS AvgLikes,
    ROUND(P.AvgEngagementScore, 2) AS AvgEngagementScore,
    RANK() OVER (ORDER BY P.AvgEngagementScore DESC) AS EngagementRank
FROM AccountStats S
LEFT JOIN PostStats P ON S.Account_Type = P.Account_Type
ORDER BY EngagementRank;



USE SocialMediaAnalytics;
GO

DROP TABLE IF EXISTS DimDate;
GO

CREATE TABLE DimDate (
    DateKey      DATE PRIMARY KEY,
    DayName      NVARCHAR(10),
    MonthName    NVARCHAR(10),
    MonthNumber  INT,
    YearNumber   INT
);
GO

WITH Dates AS (
    SELECT CAST('2024-07-01' AS DATE) AS D
    UNION ALL
    SELECT DATEADD(DAY, 1, D) FROM Dates WHERE D < '2024-07-31'
)
INSERT INTO DimDate (DateKey, DayName, MonthName, MonthNumber, YearNumber)
SELECT D, DATENAME(WEEKDAY, D), DATENAME(MONTH, D), MONTH(D), YEAR(D)
FROM Dates
OPTION (MAXRECURSION 100);
GO

SELECT COUNT(*) AS DateRows FROM DimDate;