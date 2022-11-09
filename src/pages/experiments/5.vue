<template>
  <client-only>
    <Experiment5 />
  </client-only>
</template>

<script setup lang="ts">
useHead({
  title: 'Vinícius Philot - Experiments',
  meta: [
    {
      name: 'description', content: 'Vinícius Philot is a Front-end UI developer',
    },
    {
      name: 'keywords', content: 'three.js, threeJS, shaders, front-end, front end, web development, front end development',
    },
    {
      name: 'author', content: 'Vinícius Philot',
    },
  ],
})
</script>

<route lang="yaml">
meta:
  type: experiment
</route>
