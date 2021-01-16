<template>

  <div class="buses">
    <h1>Administración de Buses</h1>
    <buses-table></buses-table>
  </div>
</template>

<script>
import axios from 'axios';

import BusesTable from './components/BusesTable.vue';

export default {
  name: 'Buses',
  components: {
    BusesTable
  },
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