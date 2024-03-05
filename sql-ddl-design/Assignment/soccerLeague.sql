-- Team
-- ----
-- TeamID (PK)
-- Name
-- Country

-- Player
-- ------
-- PlayerID (PK)
-- Name
-- TeamID (FK)

-- Game
-- ----
-- GameID (PK)
-- MatchID (FK)
-- SeasonID (FK)
-- Date

-- Goal
-- ----
-- GoalID (PK)
-- PlayerID (FK)
-- GameID (FK)
-- MinuteScored

-- Referee
-- -------
-- RefereeID (PK)
-- Name

-- Match
-- -----
-- MatchID (PK)
-- HomeTeamID (FK)
-- AwayTeamID (FK)
-- RefereeID (FK)
-- Date

-- Season
-- ------
-- SeasonID (PK)
-- StartDate
-- EndDate

CREATE TABLE Team (
    TeamID INT PRIMARY KEY,
    Name VARCHAR(100),
    Country VARCHAR(100)
);

CREATE TABLE Player (
    PlayerID INT PRIMARY KEY,
    Name VARCHAR(100),
    TeamID INT,
    FOREIGN KEY (TeamID) REFERENCES Team(TeamID)
);

CREATE TABLE Game (
    GameID INT PRIMARY KEY,
    MatchID INT,
    SeasonID INT,
    Date DATE,
    FOREIGN KEY (MatchID) REFERENCES Match(MatchID),
    FOREIGN KEY (SeasonID) REFERENCES Season(SeasonID)
);

CREATE TABLE Goal (
    GoalID INT PRIMARY KEY,
    PlayerID INT,
    GameID INT,
    MinuteScored INT,
    FOREIGN KEY (PlayerID) REFERENCES Player(PlayerID),
    FOREIGN KEY (GameID) REFERENCES Game(GameID)
);

CREATE TABLE Referee (
    RefereeID INT PRIMARY KEY,
    Name VARCHAR(100)
);

CREATE TABLE Match (
    MatchID INT PRIMARY KEY,
    HomeTeamID INT,
    AwayTeamID INT,
    RefereeID INT,
    Date DATE,
    FOREIGN KEY (HomeTeamID) REFERENCES Team(TeamID),
    FOREIGN KEY (AwayTeamID) REFERENCES Team(TeamID),
    FOREIGN KEY (RefereeID) REFERENCES Referee(RefereeID)
);

CREATE TABLE Season (
    SeasonID INT PRIMARY KEY,
    StartDate DATE,
    EndDate DATE
);
