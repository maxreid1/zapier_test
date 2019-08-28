view: send_to_slack {
  sql_table_name: public.order_items ;;
  dimension: send_to_slack_dimension {
    action: {
      label: "Send to Slack Channel"
      url: "https://hooks.zapier.com/hooks/catch/2813548/o3b5vhm/"
      form_param: {
        name: "Message"
        type: textarea
        default: "Check out {{ value }}"
      }
      form_param: {
        name: "Recipient"
        type: string
        default: "#test-channel"
      }
    }
    sql: ${TABLE}.order_id ;;
  }

}
