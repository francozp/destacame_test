<template>
  <div class="home">
    <h1 class="title">Gestión de Buses</h1>
    <hr>
    <div class="columns">
      <div class="column">
        <form>
          <h2 class="subtitle">Crear Bus</h2>
          <div class="field">
            <label class="label">Número de asientos</label>
            <div class="control">
              <input class="input" type="number">
            </div>
          </div>
          <div class="field">
            <div class="control">
              <b-button variant="success" class="button">Crear</b-button>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</template>

<script>


export default {
  name: 'Home',
  data () {
    return {

    }
  }
}
</script>
<style lang="scss">
.select, select {
  width: 100%;
}

.card {
  margin-bottom: 20px;
}

.done {
  opacity: 0.3;
}

</style>