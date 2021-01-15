<template>

  <div class="statistics">
    <h1>This is an about page</h1>

    <b-card title="Bus" sub-title="Card subtitle" v-for="bus in buses" v-bind:data="bus" v-bind:key="bus.bus_id">
        <b-card-text>
         Este es un bus. Probando conexión con backend. {{ bus.seats }}
        </b-card-text>
    </b-card>

  </div>
</template>

<script>
import axios from 'axios'

export default {
  name: 'Statistics',
  data () {
    return {
      buses: []
    }
  },
  mounted () {
    this.getBuses()
  },
  methods: {
    getBuses() {
      axios({
        method: 'get',
        url: 'http://127.0.0.1:8000/buses/',
        auth: {
          username: 'admin',
          password: 'destacametest'
        }
      }).then(response => this.buses = response.data)
    }
  }
}
</script>