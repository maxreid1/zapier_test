view: order_items {
  sql_table_name: public.order_items ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: created {
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
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: delivered {
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
    sql: ${TABLE}.delivered_at ;;
  }

  dimension: inventory_item_id {
    type: number
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension_group: returned {
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
    sql: ${TABLE}.returned_at ;;
  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
  }

  dimension_group: shipped {
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
    sql: ${TABLE}.shipped_at ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  ####
  dimension: send_to_slack_dimension {
  action: {
    label: "Send to someone via Slack"
    url: "https://hooks.zapier.com/hooks/catch/2813548/o3b5vhm/"
    form_param: {
      name: "Message"
      type: textarea
      default: "Check out {{ value }}"
    }
    form_param: {
      name: "Recipient"
      type: string
      default: ""
    }
    icon_url: "http://www.google.com/s2/favicons?domain=www.slack.com"
  }
  sql: ${TABLE}.order_id ;;
}
dimension: send_text_dimension {
  action: {
    label: "Alert via Text"
    url: "https://hooks.zapier.com/hooks/catch/2813548/o3bqjq3/"
    form_param: {
      name: "Message"
      type: textarea
      default: "Check out {{ value }}"
    }
    form_param: {
      name: "Phone Number"
      type: string
      default: ""
    }
    icon_url: "http://www.google.com/s2/favicons?domain=www.twilio.com"
  }
  sql: ${TABLE}.order_id ;;
}
dimension: create_order_form {
  action: {
    label: "Create Order Form"
    url: "https://hooks.zapier.com/hooks/catch/2813548/oosxkej/"
    form_param: {
      name: "Order ID"
      type: string
      default: "{{ value }}"
    }

    form_param: {
      name: "Name"
      type: string
      default: "{{ users.name._value }}"
    }

    form_param: {
      name: "Email"
      type: string
      default: "{{ _user_attributes.email }}"
    }

    form_param: {
      name: "Item"
      type: string
      default: "{{ products.name._value }}"
    }

    form_param: {
      name: "Price"
      type: string
      default: "{{ order_items.sale_price._value }}"
    }

    form_param: {
      name: "Comments"
      type: string
      default: " Hi {{ users.first_name._value }}, thanks for your business!"
    }
  }
  sql: ${TABLE}.order_id  ;;
}

  measure: count {
    type: count
    drill_fields: [id, users.id, users.last_name, users.first_name]
  }
}
