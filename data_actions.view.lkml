view: data_actions {
  sql_table_name: public.order_items ;;
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


}
