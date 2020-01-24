view: ndt_orders {

    derived_table: {
      datagroup_trigger: ndt_access_filter_repro_default_datagroup
      indexes: ["status"]
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
