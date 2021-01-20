<template>
  <div class="statistics">
    <h2 class="pb-3">Estadisticas</h2>
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