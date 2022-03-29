view: tweet {
  sql_table_name: `Twitter_test_data3_tweet.tweet`
    ;;
  drill_fields: [tweet_id]

  dimension: images {
    html: <img src="https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.ifj.org%2Fmedia-centre%2Fnews%2Fdetail%2Fcategory%2Fpress-releases%2Farticle%2Fqatar-saudi-led-coalition-lists-the-closure-of-al-jazeera-among-conditions-to-end-crisis.html&psig=AOvVaw2HT4eJqCAo0j-mcvs6RPIn&ust=1648621858437000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCOiLwZTZ6vYCFQAAAAAdAAAAABAJ"/> ;;
  }

  dimension: tweet_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.TweetID ;;
  }

  dimension: is_reshared {
    type: yesno
    sql: ${TABLE}.IsReshared ;;
  }

  dimension: lang {
    type: string
    sql: ${TABLE}.Lang ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
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

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.UserID ;;
  }

  dimension: user_location {
    type: string
    sql: ${TABLE}.UserLocation ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      tweet_id,
      name,
      user.user_id,
      user.name,
      tweet_coordinates.count,
      tweet_jsonasstring.count
    ]
  }
}
