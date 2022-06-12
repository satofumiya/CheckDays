<template>
  <div id="app">
    {{ message }}
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data: function () {
    return {
      message: "Hello Vue!",
      tasks: "tasks"
    }
  },
  mounted () {
    this.setTask();
  },
  methods: {
    setTask: function() {
      axios.get('/api/tasks')
      .then(response => (
        this.tasks = response.data
      ))
    },
  }
}

</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
