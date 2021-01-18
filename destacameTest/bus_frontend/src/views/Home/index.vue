<template>
  <div class="home">
    <search-card></search-card>
  </div>
</template>

<script>
import SearchCard from './components/SearchCard.vue';

export default {
  name: 'Home',
  components: {
    SearchCard
  }
}
</script>