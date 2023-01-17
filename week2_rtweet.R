library(rtweet)

# Autenticate
auth_setup_default()


#Save the options as variables
query_term = "COP26" #try with GlasgowPact, too

number_tweets = 1000

#Get the Twitter data. Retweets are excluded.
tweets <- search_tweets(query_term, n=number_tweets, include_rts = FALSE)

#Create the CSV name with the source, query and time and write it to local folder
csvFileName = paste0("twitter", "_", query_term, "_", Sys.Date(), '.csv')
rtweet::write_as_csv(tweets, paste0("data/week2/",csvFileName))