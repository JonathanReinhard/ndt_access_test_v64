view: ndt_orders {

    derived_table: {
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
