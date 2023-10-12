nba_advanced_stats <- read.csv("C:/Users/broco/OneDrive/Documents/R/Notre Dame/Data Wrangling/data_wrangling/nba_advacned_stats.csv")
nba_player_box_score <- read.csv("C:/Users/broco/OneDrive/Documents/R/Notre Dame/Data Wrangling/data_wrangling/nba_player_box_score.csv")


## aggregate(WL ~ TEAM_NAME, nba_advanced_stats, )



library(dplyr)
wins <- nba_advanced_stats %>%
  group_by(TEAM_NAME) %>%
  summarise(Wins = sum(WL == "W"),
            assists = mean(AST_RATIO, na.rm = TRUE)) %>% 
          arrange(desc(Wins))
      
  
  
library(ggplot2)
wins_graph <- ggplot(wins, aes(x =Wins , y= reorder(TEAM_NAME, Wins))) + geom_bar(stat="identity") 
print(wins_graph)
