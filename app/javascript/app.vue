<template>
  <div id="app" class="bg-white">
    <div>
      <input v-model="title" placeholder="やること">
      <button v-on:click='addTask'>やることを追加する</button>
    </div>

    <ul>
      <li v-for="task in tasks" :key="task.id">
        <p v-if="task.done">{{ task.title }} : タスク完了</p>
        <p v-else-if="!task.done">{{ task.title }}</p>
      </li>
    </ul>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data: function () {
    return {
      tasks: "tasks",
      title:''
    }
  },
  mounted () {
    this.setTask();
  },
  methods: {
    setTask: function() {
      let apiUrl = window.location.href.split('/').splice(3,4).join('/');
      axios.get('/'+apiUrl+'/api/tasks')
      .then(response => (
        this.tasks = response.data
      ))
    },
    addTask: function() {
      let apiUrl = window.location.href.split('/').splice(3,4).join('/');
      axios.post('/'+apiUrl+'/api/tasks',{
        title: this.title,
      })
      .then(response => (
        this.setTask(),
        this.title = ''
      ));
    }
}
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
