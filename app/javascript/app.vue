<template>
  <div id="app" class="bg-white">
    <div>
      <input v-model="title" placeholder="やること">
      <button @click='addTask'>やることを追加する</button>
    </div>

    <ul>
      <li v-for="task in tasks" :key="task.id">
        <input type="checkbox" @change="taskDone(task.done,task.id)" v-model="task.done" :checked="task.done">
        <p v-if="!task.done">{{ task.title }}</p>
        <p v-else><strike>{{ task.title }}</strike></p>
        <button @click='deleteTask(task.id)'>削除</button>
        <button @click='updateTask(task.id)'>更新</button>
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
      title:'',
      currentUrl: window.location.href.split('/').splice(3,4).join('/'),
    }
  },
  mounted () {
    this.setTask();
  },
  conputed: {
    nowUrl: function(){
      this.currentUrl = window.location.href.split('/').splice(3,4).join('/')
    }
  },
  methods: {
    setTask: function() {
      axios.get('/'+this.currentUrl+'/api/tasks')
      .then(response => (
        this.tasks = response.data
      ))
    },
    addTask: function() {
      axios.post('/'+this.currentUrl+'/api/tasks',{
        title: this.title,
      })
      .then(response => (
        this.setTask(),
        this.title = ''
      ));
    },
    deleteTask: function(id){
    axios.delete('/'+this.currentUrl+'/api/tasks/'+id)
    .then(response => (
      this.setTask()
    ));
    },
    taskDone: function(now,id){
      if (now != false) now = true;
      else now = false;
      axios.patch('/'+this.currentUrl+'/api/tasks/'+id,{
        done: now,
      })
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
