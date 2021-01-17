<template>

  <div class="courses">
    <h1>Administración de Trayectos</h1>
    <courses-table></courses-table>
  </div>
</template>

<script>
import CoursesTable from './components/CoursesTable.vue';

export default {
  name: 'Courses',
  components: {
    CoursesTable
  }
}
</script>