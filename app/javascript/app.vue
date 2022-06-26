<template>
  <v-app id="bg">
    <div class="d-flex justify-content-center">
      <div class="d-flex flex-column w-75 bg-white align-items-center">
        <v-row class="mt-5 d-flex flex-wrap">
          <v-col cols="12">
            <span id="largeTitle">「{{ subgoal.title }}」</span>
            <h1 class="subTitle d-flex justify-end">
              を達成するためにやることを考えましょう。
            </h1>
          </v-col>
        </v-row>
        <v-container>
          <v-row
            cols="12"
            class="d-flex flex-column justify-center align-center mt-3"
          >
            <v-col cols="8" class="d-flex justify-center mt-md-5">
              <v-text-field
                v-model="title"
                placeholder="やること"
                solo
                id="todoTitle"
            /></v-col>
            <v-col cols="8" class="d-flex justify-end" flat>
              <v-btn
                @click="addTask"
                color="blue"
                class="white--text font-weight-black"
                id="addTodo"
                rounded
                >やることを追加する</v-btn
              >
            </v-col>
          </v-row>
        </v-container>
        <v-container>
          <v-card class="d-flex" v-for="(task, index) in tasks" :key="task.id">
            <v-row cols="10" class="d-flex justify-center flex-wrap">
              <v-col lg="1" class="d-flex align-center justify-center">
                <v-icon class="mb-1 me-2">fas fa-list</v-icon>
                <v-checkbox
                  @change="taskUpdate(index, task.id, 'done')"
                  v-model="task.done"
                  id="taskDone"
                />
              </v-col>
              <v-col cols="12" sm="8" class="d-flex align-center">
                <v-text-field
                  full-width
                  v-model="task.title"
                  v-if="!task.done"
                  @change="taskUpdate(index, task.id, 'title')"
                  class="recordedTodo"
                ></v-text-field>
                <p v-else class="my-3 taskText">
                  <strike>{{ task.title }}</strike>
                </p>
              </v-col>

              <v-col cols="2" class="d-flex align-center justify-center">
                <v-btn @click="deleteTask(task.id)">削除</v-btn>
              </v-col>
            </v-row>
          </v-card>
        </v-container>
      </div>
    </div>
  </v-app>
</template>

<script>
import axios from "axios";

export default {
  data: function () {
    return {
      tasks: "tasks",
      title: "",
      subgoal: "",
      subGoalLength: "",
      currentUrl: window.location.href.split("/").splice(3, 4).join("/"),
    };
  },
  mounted() {
    this.setTask();
  },
  conputed: {
    nowUrl: function () {
      this.currentUrl = window.location.href.split("/").splice(3, 4).join("/");
    },
  },
  methods: {
    setTask: function () {
      axios
        .get("/" + this.currentUrl + "/api/tasks")
        .then(
          (response) => (
            (this.subgoal = response.data[0]),
            (this.tasks = response.data[2]),
            (this.subGoalLength = response.data[0].title.length)
          )
        );
    },
    addTask: function () {
      axios
        .post("/" + this.currentUrl + "/api/tasks", {
          title: this.title,
        })
        .then((response) => (this.setTask(), (this.title = "")));
    },
    deleteTask: function (id) {
      axios
        .delete("/" + this.currentUrl + "/api/tasks/" + id)
        .then((response) => this.setTask());
    },
    taskUpdate: function (index, id, key) {
      axios.patch("/" + this.currentUrl + "/api/tasks/" + id, {
        [key]: this.tasks[index][key],
      });
    },
  },
};
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
#bg {
  background-color: #e6e6e6;
}
@media screen and (minwidth: 1024px) {
  #largeTitle {
    font-size: 1rem;
  }
  #smallTitle {
    font-size: 1rem;
  }
}
</style>
