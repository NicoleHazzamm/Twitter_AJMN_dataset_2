view: tweet_coordinates {
  sql_table_name: `Twitter_test_data3_tweet.tweet_coordinates`
    ;;

  dimension: is_reshared {
    type: yesno
    sql: ${TABLE}.IsReshared ;;
  }

  dimension: lang {
    type: string
    sql: ${TABLE}.Lang ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}.Location ;;
  }

  dimension: reach {
    type: number
    sql: ${TABLE}.Reach ;;
  }

  dimension: retweet_count {
    type: number
    sql: ${TABLE}.RetweetCount ;;
  }

  dimension: sentiment {
    type: number
    sql: ${TABLE}.Sentiment ;;
  }

  dimension_group: time {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.time ;;
  }

  dimension: tweet {
    type: string
    sql: ${TABLE}.tweet ;;
  }

  dimension: tweet_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.TweetID ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.UserID ;;
  }

  measure: count {
    type: count
    drill_fields: [user.user_id, user.name, tweet.tweet_id, tweet.name]
  }
}
