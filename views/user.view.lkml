view: user {
  sql_table_name: `Twitter_test_data3_tweet.user`
    ;;
  drill_fields: [user_id]

  dimension: user_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.UserID ;;
  }

  dimension: image_url {
    type: string
    sql: ${TABLE}.ImageURL ;;
    html: <img src="{{value}}"> ;;
  }


  dimension: location {
    type: string
    sql: ${TABLE}.Location ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.Name ;;
  }

  measure: count {
    type: count
    drill_fields: [user_id, name, tweet_coordinates.count, tweet.count]
  }

  dimension: is_presenter {
    type: yesno
    sql: ${user_id} in (1503,7632,10660,13352,20203,59173,66243,165293,476083,608583);;
  }
}
