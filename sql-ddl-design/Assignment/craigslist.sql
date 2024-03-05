-- Region
-- ------
-- RegionID (PK)
-- Name

-- User
-- ----
-- UserID (PK)
-- Username
-- PreferredRegionID (FK)

-- Post
-- ----
-- PostID (PK)
-- Title
-- Text
-- UserID (FK)
-- Location
-- RegionID (FK)

-- Category
-- --------
-- CategoryID (PK)
-- Name

-- PostCategory (Association Table)
-- --------------------------------
-- PostID (FK)
-- CategoryID (FK)

CREATE TABLE Region (
    RegionID INT PRIMARY KEY,
    Name VARCHAR(100)
);

CREATE TABLE User (
    UserID INT PRIMARY KEY, 
    UserName VARCHAR(100),
    PreferredRegionID INT,
    FOREIGN KEY (PreferredRegionID) REFERENCES Region(RegionID)
);

CREATE TABLE Post (
    PostID INT PRIMARY KEY,
    Title VARCHAR(255),
    Text TEXT,
);

CREATE TABLE PostCategory (
    PostID INT,
    CategoryID INT,
    PRIMARY KEY (PostID, CategoryID), --we are making a unique pk by combining 2 columns from this table called a composite key
    --this creates more uniqueness so that each postid and categoryid is different always 
    --is enforces data integrity be ensuring that each post-cateogry association is uniquely identified 
    FOREIGN KEY (PostID) REFERENCES Post(PostID),
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);