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
    sql: ${user_id} in (1503,1491906525421609000,302189775,1417850839910162400,255057696,834466861,839848894670356500,972820757662253000,774721585534083100,1362177019);;
  }
}
