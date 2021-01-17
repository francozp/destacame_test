<template>

  <div class="drivers">
    <h1>Administración de Choferes</h1>
    <drivers-table></drivers-table>
  </div>
</template>

<script>
import DriversTable from './components/DriversTable.vue';

export default {
  name: 'Drivers',
  components: {
    DriversTable
  }
}
</script>