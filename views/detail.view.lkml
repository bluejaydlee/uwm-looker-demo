# The name of this view in Looker is "Detail"
view: detail {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `uwm-demo.Underwriting.Detail` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Credit Date Time" in Explore.

  dimension: credit_date_time {
    type: string
    sql: ${TABLE}.CreditDateTime ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: date_dim_id {
    type: time
    description: "%m/%d/%E4Y"
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Date_Dim_Id ;;
  }

  dimension: day_name {
    type: string
    sql: ${TABLE}.DayName ;;
  }

  dimension: emp_adp_id2 {
    type: number
    value_format_name: id
    sql: ${TABLE}.Emp_ADP_Id2 ;;
  }

  dimension: emp_name2 {
    type: string
    sql: ${TABLE}.Emp_Name2 ;;
  }

  dimension: emp_title2 {
    type: string
    sql: ${TABLE}.Emp_Title2 ;;
  }

  dimension: flags {
    type: string
    sql: ${TABLE}.Flags ;;
  }

  dimension: loan_id {
    type: number
    sql: ${TABLE}.LoanID ;;
  }

  dimension: loan_type {
    type: string
    sql: ${TABLE}.Loan_Type ;;
  }

  dimension: point_type {
    type: string
    sql: ${TABLE}.PointType ;;
  }

  dimension: point_value2 {
    type: number
    sql: ${TABLE}.PointValue2 ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_point_value2 {
    type: sum
    sql: ${point_value2} ;;  }
  measure: average_point_value2 {
    type: average
    sql: ${point_value2} ;;  }

  dimension: uw_pod_name2 {
    type: string
    sql: ${TABLE}.UW_POD_Name2 ;;
  }

  dimension: uw_team_name {
    type: string
    sql: ${TABLE}.UW_Team_Name ;;
  }

  dimension: weeknum2 {
    type: number
    sql: ${TABLE}.Weeknum2 ;;
  }
  measure: count {
    type: count
    drill_fields: [uw_team_name, day_name]
  }
}
