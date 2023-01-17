library(rtoot)

query_term <- "chatpgt"

# We need a token from https://instances.social/api/token
fedi_instances <- get_fedi_instances("Uhp6KfvX1qrhlmoOT6icqRFE4nqU3J3wPGQKwWGxEebuNAAhWuLGFXqmjPJKrqItkEjXRR2dM9tb5C25Z0CODZ6IvjKb8TMcA8AG2HNqNUUMZAwsfiC39mr76Kt3u36x")


masto_social <- get_timeline_hashtag(hashtag = query_term , 
                                     limit = 100, 
                                     instance = "mastodon.social")

fosstodon <- get_timeline_hashtag(hashtag = query_term , limit = 100, 
                                  instance = "fosstodon.org")

# Optional: add a column with the instance's name.
masto_social$instance <- "mastodon.social"
fosstodon$instance <- "fosstodon.org"

# Combine all toots from different instances
toots <- rbind(masto_social, fosstodon)


#Create the CSV name with the source, query and time and write it to local folder
csvFileName = paste0("mastodon", "_", query_term, "_", Sys.Date(), '.csv')
write.csv(toots, paste0("data/week2/",csvFileName))