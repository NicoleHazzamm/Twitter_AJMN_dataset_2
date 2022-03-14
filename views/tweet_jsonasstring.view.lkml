view: tweet_jsonasstring {
  sql_table_name: `Twitter_test_data3_tweet.tweetJson-as-string`
    ;;

  dimension: tweet_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.TweetID ;;
  }

  dimension: tweet_json {
    type: string
    sql: ${TABLE}.TweetJson ;;
  }

  measure: count {
    type: count
    drill_fields: [tweet.tweet_id, tweet.name]
  }
}
