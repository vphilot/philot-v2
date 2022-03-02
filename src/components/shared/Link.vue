<script setup lang="ts">
import { Icon } from '@iconify/vue'

defineProps({
  url: String,
  title: String,
  dashed: {
    type: Boolean,
    default: true,
  },
  external: {
    type: Boolean,
    default: true,
  },
})
</script>

<template>
  <a rel="noreferrer" :href="url" :title="title" :target="external ? '_blank' : '_self'" :class="['inline-flex items-center', ...[dashed ? 'underline underline-offset-4 decoration-pink-500 dark:decoration-green-500 decoration-dotted' : 'border-b border-b-pink-500 dark:border-b-green-500']]">

    <span class="shrink-0">
      <slot />
    </span>
    <Icon v-if="external" icon="wi:direction-up-right" width="64" class="text-pink-500 dark:text-green-500 w-6 h-6" />
  </a>
</template>
