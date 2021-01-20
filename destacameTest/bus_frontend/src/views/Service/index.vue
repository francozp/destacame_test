<template>

  <div class="passengers">
    <seat-selection></seat-selection>
  </div>
</template>

<script>
import SeatSelection from './components/SeatSelection.vue';

export default {
  name: 'Service',
  components: {
    SeatSelection
  }
}
</script>