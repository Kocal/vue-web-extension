<template>
  <div>
    {{#if router}}
    <router-view></router-view>
    {{else}}
    <p>Hello world!</p>
    {{/if}}
  </div>
</template>

<script>
  export default {
    data () {
      return {}
    }
  }
</script>

<style lang="scss" scoped>
  {{#unless router}}
  p {
    font-size: 20px;
  }
  {{/unless}}
</style>
