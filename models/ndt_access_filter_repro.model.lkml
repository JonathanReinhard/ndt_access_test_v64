connection: "thelook"

# include all the views
include: "/views/**/*.view"

datagroup: ndt_access_filter_repro_default_datagroup {
  sql_trigger: SELECT MINUTE(NOW());;
#   max_cache_age: "1 hour"
}

persist_with: ndt_access_filter_repro_default_datagroup

# explore: ndt_orders {}

explore: ndt_ndt_orders_orders {}

explore: orders_3 {
  from: orders
  join: ndt_orders {
    sql_on: ${orders_3.status} = ${ndt_orders.status} ;;
    relationship: many_to_one
    type: left_outer
  }
  access_filter: {
    field: ndt_orders.status
    user_attribute: status_ndt_test
  }
}

explore: events {
  join: users {
    type: left_outer
    sql_on: ${events.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: inventory_items {
  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }
}

explore: order_items {
  join: orders {
    type: left_outer
    sql_on: ${order_items.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

  join: inventory_items {
    type: left_outer
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }

  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }
}

explore: orders {
  always_join: [users]
  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
#   access_filter: {
#     field: status
#     user_attribute: status_ndt_test
#   }
  access_filter: {
    field: users.id
    user_attribute: ndt_test_user_id
  }
}

explore: orders_extended {
  extends: [orders]
  view_name: orders
  access_filter: {
    field: status
    user_attribute: status_ndt_test
  }
}

explore: products {}

explore: schema_migrations {}

explore: user_data {
  join: users {
    type: left_outer
    sql_on: ${user_data.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: users {}
