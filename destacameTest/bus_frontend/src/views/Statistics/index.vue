<template>

  <div class="statistics">
    <h1>This is an about page</h1>

  </div>
</template>

<script>
import axios from 'axios'

export default {
  name: 'Statistics',
  data () {
    return {
      buses: [],
      trips: [],
      course_id: 4,
      percentage: 5
    }
  },
  mounted () {
    this.get_trips_mean(),
    this.get_bus_capacity()
  },
  methods: {
    get_trips_mean(){
      axios({
          method: 'get',
          url: 'http://127.0.0.1:8000/trips/get_trips_mean',
          //Authentification
          auth: {
            username: 'admin',
            password: 'destacametest'
          }
      }).then((response) => {
        this.trips = response.data // Assign retrieved items
        console.log(this.trips)
      })
    },
    get_bus_capacity(){
      axios({
          method: 'get',
          url: 'http://127.0.0.1:8000/trips/get_bus_capacity/?course_id=' + this.course_id + '&N=' + this.percentage,
          //Authentification
          auth: {
            username: 'admin',
            password: 'destacametest'
          }
      }).then((response) => {
        this.buses = response.data // Assign retrieved items
        console.log(this.buses)
      })
    },
  }
}
</script>