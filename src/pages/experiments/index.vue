<template>
  <div>
    <div class="grid grid-cols-1 md:grid-cols-2 gap-x-8 w-full md:w-2/3 font-sans font-extralight text-lg tracking-wide leading-relaxed">
      <section class="md:col-span-2">
        <IntersectionObserved>
          <h2 class="font-sans font-extralight md:font-thin text-3xl mb-8 lg:text-5xl leading-tight">
            (sup! 👋)
          </h2>
          <p class="mb-8">
            All routes described here are WIP, not even close to production ready.
          </p>
        </IntersectionObserved>
      </section>
    </div>
    <pre>
      {{ posts }}
    </pre>
  </div>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import routes from '~pages'

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

const posts = computed(() => (routes.filter(route => route.meta?.type === 'experiment') as unknown as { name: string; path: string; icon: string; date: string }[]))
</script>
