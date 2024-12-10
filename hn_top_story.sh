#!/bin/bash

# Fetch the top story IDs from Hacker News
TOP_STORY_ID=$(curl -s https://hacker-news.firebaseio.com/v0/topstories.json | grep -o '[0-9]*' | head -n 1)

# Fetch the details of the top story
STORY_JSON=$(curl -s https://hacker-news.firebaseio.com/v0/item/$TOP_STORY_ID.json)

# Extract the title, url, and score from the JSON
TITLE=$(echo $STORY_JSON | grep -o '"title":"[^"]*' | grep -o '[^"]*$')
URL=$(echo $STORY_JSON | grep -o '"url":"[^"]*' | grep -o '[^"]*$')
SCORE=$(echo $STORY_JSON | grep -o '"score":[0-9]*' | grep -o '[0-9]*')

# Display the results
echo "Top Hacker News Story:"
echo "Title: $TITLE"
echo "Link: $URL"
echo "Points: $SCORE"