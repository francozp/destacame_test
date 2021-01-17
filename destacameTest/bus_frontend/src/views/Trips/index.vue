<template>

  <div class="trips">
    <trips-card></trips-card>
  </div>
</template>

<script>
import TripsCard from './components/TripsCard.vue';

export default {
  name: 'Trips',
  components: {
    TripsCard
  }
}
</script>