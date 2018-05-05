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

{{#unless router}}<style lang="scss" scoped>
p {
  font-size: 20px;
}
</style>{{/unless}}
