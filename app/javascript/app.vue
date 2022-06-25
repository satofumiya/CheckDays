<template>
<<<<<<< Updated upstream
  <div id="app">
    <Header />
    <p>{{ message }}</p>
    <Top />
  </div>
=======
  <v-app id="bg">
    <div class="d-flex justify-content-center">
      <div class="d-flex flex-column w-75 bg-white align-items-center">
        <v-row class="mt-5 d-flex flex-wrap">
          <v-col cols="12">
            <span v-if="subGoalLength < 24" class="text-h4"
              >「{{ subgoal.title }}」</span
            >
            <span v-else class="text-h5">「{{ subgoal.title }}」</span>
            <h1 class="d-flex justify-end font-weight-bold me-5">
              を達成するためにやることを考えましょう。
            </h1>
          </v-col>
          <v-col class="d-flex justify-end me-5">
            <a :href="parentUrl"><v-btn>サブゴール一覧にもどる</v-btn></a>
          </v-col>
        </v-row>
        <v-container>
          <v-row
            cols="12"
            class="d-flex flex-column justify-center align-center mt-3"
          >
            <v-col cols="8" class="d-flex justify-center mt-5">
              <v-text-field v-model="title" placeholder="やること" solo
            /></v-col>
            <v-col cols="8" class="d-flex justify-end" flat>
              <v-btn
                @click="addTask"
                color="blue"
                class="white--text font-weight-black"
                rounded
                >やることを追加する</v-btn
              >
            </v-col>
          </v-row>
        </v-container>
        <v-container>
          <v-card class="d-flex" v-for="(task, index) in tasks" :key="task.id">
            <v-row cols="10" class="d-flex justify-center">
              <v-col cols="1" class="d-flex align-center justify-center">
                <v-icon>fas fa-list</v-icon>
              </v-col>
              <v-col cols="1" class="d-flex align-center justify-center">
                <v-checkbox
                  @change="taskUpdate(index, task.id, 'done')"
                  v-model="task.done"
                />
              </v-col>
              <v-col cols="6">
                <v-text-field
                  full-width
                  v-model="task.title"
                  v-if="!task.done"
                  @change="taskUpdate(index, task.id, 'title')"
                ></v-text-field>
                <p v-else class="my-3">
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
>>>>>>> Stashed changes
</template>

<script>
import Header from "./components/header";
import Top from "./components/top.vue";

export default {
  data: function () {
    return {
<<<<<<< Updated upstream
      message: "Hello Vue!"
    }
=======
      tasks: "tasks",
      title: "",
      subgoal: "",
      subGoalLength: "",
      currentUrl: window.location.href.split("/").splice(3, 4).join("/"),
      parentUrl: window.location.href.split("/").splice(0, 6).join("/"),
    };
  },
  mounted() {
    this.setTask();
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
>>>>>>> Stashed changes
  },
  components: {
    Top,
    Header
  }
}

</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
