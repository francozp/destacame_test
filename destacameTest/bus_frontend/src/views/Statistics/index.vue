<template>
  <div class="statistics">
    <h1 class="pb-3">Estadisticas</h1 >
        <statistics-table></statistics-table>
  </div>
</template>

<script>
import StatisticsTable from './components/StatisticsTable.vue';

export default {
  components: { StatisticsTable },
  name: 'Statistics',
  data () {
    return {
    }
  }
}
</script>