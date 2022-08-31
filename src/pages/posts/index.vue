<script setup lang="ts">
import { Icon } from '@iconify/vue'

import { computed } from 'vue'
import routes from '~pages'

const posts = computed(() => (routes.filter(route => route.meta?.type === 'post') as unknown as { name: string; path: string; icon: string; date: string }[]).sort((a, b) => new Date(b.date) - new Date(a.date)))
const formatDate = (date: string) => {
  const months = [
    'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December',
  ]
  const d = new Date(date)
  const day = d.getUTCDay()
  const month = months[d.getUTCMonth()]
  const year = d.getUTCFullYear()
  return `${month} ${day}, ${year}`
}

useHead({
  title: 'Vinícius Philot - Posts',
  meta: [
    { name: 'description', content: 'Vinícius Philot is a Front-end UI developer' },
  ],
})
</script>

<template>
  <div class="grid grid-cols-1 md:grid-cols-2 gap-x-8 items-stretch w-full">
    <h1 class="sr-only">
      Posts
    </h1>
    <div v-for="post in posts" :key="post.name">
      <router-link :to="post.path">
        <div>
          <Icon :icon="post.icon" width="64" class="w-8 h-8 mb-2 text-pink-500 dark:text-green-500" />
          <h2 class="text-3xl lg:text-5xl font-extralight md:font-thin tracking-wide lg:leading-snug">
            {{ post.name }}
          </h2>
          <p class="font-serif font-extralight text-lg tracking-wide">
            {{ formatDate(post.date) }}
          </p>
        </div>
        <DividerY />
      </router-link>
    </div>
  </div>
</template>
