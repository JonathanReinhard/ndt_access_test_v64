view: ndt_orders {
  derived_table: {
    datagroup_trigger: ndt_access_filter_repro_default_datagroup
    explore_source: orders {
      column: status {}
      column: count {}
    }
  }
  dimension: status {}
  dimension: count {
    type: number
  }
}

view: ndt_ndt_orders_orders {
  derived_table: {
    datagroup_trigger: ndt_access_filter_repro_default_datagroup
    explore_source: orders_3 {
      column: status {}
      column: created_year {}
      column: overall_count { field: ndt_orders.count }
      column: count {}
    }
  }
  dimension: status {}
  dimension: created_year {
    type: date_year
  }
  dimension: overall_count {
    type: number
  }
  dimension: count {
    type: number
  }
}
