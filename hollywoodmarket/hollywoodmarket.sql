-- hollywoodmarket.annualticketsales definition
CREATE TABLE `annualticketsales` (
  `year` int NOT NULL,
  `tickets_sold` bigint DEFAULT NULL,
  `total_inflation_adjusted_box_office` bigint DEFAULT NULL,
  `average_ticket_price` double DEFAULT NULL,
  `total_box_office` bigint DEFAULT NULL,
  PRIMARY KEY (`year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- hollywoodmarket.highestgrossers definition
CREATE TABLE `highestgrossers` (
  `year` int NOT NULL,
  `movie` varchar(45) DEFAULT NULL,
  `genre` varchar(45) DEFAULT NULL,
  `mpaa_rating` varchar(45) DEFAULT NULL,
  `distributor` varchar(45) DEFAULT NULL,
  `total_for_year` bigint DEFAULT NULL,
  `total_in_2019_dollars` bigint DEFAULT NULL,
  `tickets_sold` bigint DEFAULT NULL,
  PRIMARY KEY (`year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- hollywoodmarket.popularcreativetypes definition
CREATE TABLE `popularcreativetypes` (
  `rank` int NOT NULL,
  `creative_types` varchar(45) DEFAULT NULL,
  `movies` bigint DEFAULT NULL,
  `total_gross` bigint DEFAULT NULL,
  `average_gross` bigint DEFAULT NULL,
  `market_share` double DEFAULT NULL,
  PRIMARY KEY (`rank`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- hollywoodmarket.topdistributors definition
CREATE TABLE `topdistributors` (
  `rank` int NOT NULL,
  `distributors` varchar(45) DEFAULT NULL,
  `movies` bigint DEFAULT NULL,
  `total_gross` bigint DEFAULT NULL,
  `average_gross` bigint DEFAULT NULL,
  `market_share` double DEFAULT NULL,
  PRIMARY KEY (`rank`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- hollywoodmarket.topgenres definition
CREATE TABLE `topgenres` (
  `rank` int NOT NULL,
  `generes` varchar(45) DEFAULT NULL,
  `movies` bigint DEFAULT NULL,
  `total_gross` bigint DEFAULT NULL,
  `average_gross` bigint DEFAULT NULL,
  `market_share` double DEFAULT NULL,
  PRIMARY KEY (`rank`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- hollywoodmarket.topgrossingratings definition
CREATE TABLE `topgrossingratings` (
  `rank` int NOT NULL,
  `mpaa_rating` varchar(45) DEFAULT NULL,
  `movies` bigint DEFAULT NULL,
  `total_gross` bigint DEFAULT NULL,
  `average_gross` bigint DEFAULT NULL,
  `market_share` double DEFAULT NULL,
  PRIMARY KEY (`rank`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- hollywoodmarket.topgrossingsources definition
CREATE TABLE `topgrossingsources` (
  `rank` int NOT NULL,
  `sources` varchar(45) DEFAULT NULL,
  `movies` bigint DEFAULT NULL,
  `total_gross` bigint DEFAULT NULL,
  `average_gross` bigint DEFAULT NULL,
  `market_share` double DEFAULT NULL,
  PRIMARY KEY (`rank`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- hollywoodmarket.topproductionmethods definition
CREATE TABLE `topproductionmethods` (
  `rank` int NOT NULL,
  `production_methods` varchar(45) DEFAULT NULL,
  `total_gross` bigint DEFAULT NULL,
  `average_gross` bigint DEFAULT NULL,
  `market_share` double DEFAULT NULL,
  `movies` bigint DEFAULT NULL,
  PRIMARY KEY (`rank`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- hollywoodmarket.widereleasescount definition
CREATE TABLE `widereleasescount` (
  `year` int NOT NULL,
  `warner_bros` int DEFAULT NULL,
  `walt_disney` int DEFAULT NULL,
  `20th_century_fox` int DEFAULT NULL,
  `paramount_pictures` int DEFAULT NULL,
  `sony_pictures` int DEFAULT NULL,
  `universal` int DEFAULT NULL,
  `total_major_6` int DEFAULT NULL,
  `total_other_studis` int DEFAULT NULL,
  PRIMARY KEY (`year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;