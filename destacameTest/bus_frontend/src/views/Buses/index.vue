<template>

  <div class="buses">
    <h1>Administración de Buses</h1>
    <buses-table></buses-table>
  </div>
</template>

<script>
import BusesTable from './components/BusesTable.vue';
export default {
  name: 'Buses',
  components: {
    BusesTable
  }
}
</script>