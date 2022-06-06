<template>
  <div id="app">
    <Header />
    <p>{{ message }}</p>
    <Top />
  </div>
</template>

<script>
import Header from "./components/header";
import Top from "./components/top.vue";

export default {
  data: function () {
    return {
      message: "Hello Vue!"
    }
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
