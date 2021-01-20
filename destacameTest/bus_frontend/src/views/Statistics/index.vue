<template>

  <div class="statistics">
    <h2>Estadisticas</h2>
        <trips-mean></trips-mean>
  </div>
</template>

<script>
import axios from 'axios';
import TripsMean from './components/TripsMean.vue';

export default {
  components: { TripsMean },
  name: 'Statistics',
  data () {
    return {
    }
  }
}
</script>