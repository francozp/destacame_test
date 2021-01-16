<template>

  <div class="passengers">
    <h1>Administración de Pasajeros</h1>
    <passengers-table></passengers-table>
  </div>
</template>

<script>
import PassengersTable from './components/PassengersTable.vue';

export default {
  name: 'Passengers',
  components: {
    PassengersTable
  }
}
</script>