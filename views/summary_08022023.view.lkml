# The name of this view in Looker is "Summary 08022023"
view: summary_08022023 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `uwm-demo.Underwriting.Summary_08022023` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Ctc" in Explore.

  dimension: ctc {
    type: number
    sql: ${TABLE}.CTC ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_ctc {
    type: sum
    sql: ${ctc} ;;  }
  measure: average_ctc {
    type: average
    sql: ${ctc} ;;  }

  dimension: emp_adp_id {
    type: number
    sql: ${TABLE}.Emp_ADP_Id ;;
  }

  dimension: emp_name {
    type: string
    sql: ${TABLE}.Emp_Name ;;
  }

  dimension: emp_title {
    type: string
    sql: ${TABLE}.Emp_Title ;;
  }

  dimension: point_value1 {
    type: number
    sql: ${TABLE}.PointValue1 ;;
  }

  dimension: uw_pod_name {
    type: string
    sql: ${TABLE}.UW_POD_Name ;;
  }

  dimension: uw_team_name1 {
    type: string
    sql: ${TABLE}.UW_Team_Name1 ;;
  }

  dimension: weeknum {
    type: number
    sql: ${TABLE}.Weeknum ;;
  }
  measure: count {
    type: count
    drill_fields: [emp_name, uw_pod_name]
  }
}
