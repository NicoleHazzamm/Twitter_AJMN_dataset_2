connection: "looker_dataset_2"

# include all the views
include: "/views/**/*.view"

datagroup: twitter_ajmn_dataset_2_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: twitter_ajmn_dataset_2_default_datagroup

explore: tweet_coordinates {
  join: user {
    type: left_outer
    sql_on: ${tweet_coordinates.user_id} = ${user.user_id} ;;
    relationship: many_to_one
  }

  join: tweet {
    type: left_outer
    sql_on: ${tweet_coordinates.tweet_id} = ${tweet.tweet_id} ;;
    relationship: many_to_one
  }
}

explore: user {}

explore: tweet {
  join: user {
    type: left_outer
    sql_on: ${tweet.user_id} = ${user.user_id} ;;
    relationship: many_to_one
  }
}

explore: tweet_jsonasstring {
  join: tweet {
    type: left_outer
    sql_on: ${tweet_jsonasstring.tweet_id} = ${tweet.tweet_id} ;;
    relationship: many_to_one
  }

  join: user {
    type: left_outer
    sql_on: ${tweet.user_id} = ${user.user_id} ;;
    relationship: many_to_one
  }
}
