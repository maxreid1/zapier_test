connection: "thelook_events"

include: "/*/*.view.lkml"                       # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }

explore: order_items {
  join: users {
    relationship: many_to_one
    sql_on: ${order_items.user_id} = ${users.id} ;;
  }
  join: products {
    relationship: many_to_one
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
  }
  join: inventory_items {
    relationship: many_to_one
    type: full_outer
    sql_on: ${inventory_items.id} = ${order_items.inventory_item_id} ;;
  }
}


explore: solved_tickets {}

explore: account_and_opp {}
