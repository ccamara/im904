
# Setup -------------------------------------------------------------------

# Installing packages
# Uncomment the line below if you need to install the package:
# install.packages('RedditExtractoR')

library(RedditExtractoR)


# Query -------------------------------------------------------------------

# Save the options as variables
query_term = "chatpgt"

# We might want to filter our search to a particular subreddit
sub_reddit= NA

sort_ops = "comments"

# period can be changed. Type ?find_thread_urls into the terminal to get help. 
time_period = "week"

# Get the Reddit urls that match contain the keyword that we are looking for
reddit_urls = find_thread_urls(keywords = query_term, subreddit= sub_reddit,
                               sort_by = sort_ops, period = time_period)


# now we get the associated content for every url
reddit_data = get_thread_content(reddit_urls$url)

# Combine the two data frames.
merged_data = merge(reddit_data$threads, reddit_data$comments, by="url")

# Store the combined data frame into a file.
csvFileName = paste0("reddit_",query_term,"_", Sys.Date(), '.csv')
write.csv(merged_data, paste0("data/week2/", csvFileName))


# Data exploration --------------------------------------------------------



