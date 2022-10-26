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
  download: {
    type: Boolean,
    default: false,
  },
})
</script>

<template>
  <a rel="noreferrer" :href="url" :title="title" :target="external ? '_blank' : '_self'" v-bind="$attrs" :class="['inline-flex items-center', ...[dashed ? 'underline underline-offset-4 decoration-green-600 dark:decoration-green-500 decoration-dotted' : 'border-b border-b-green-600 dark:border-b-green-500']]">
    <span class="shrink-0">
      <slot />
    </span>
    <Icon
      v-if="download" icon="wi:direction-down" width="64" class="text-green-600 dark:text-green-500 w-6 h-6"
    />
    <Icon v-else-if="external" icon="wi:direction-up-right" width="64" class="text-green-600 dark:text-green-500 w-6 h-6" />
  </a>
</template>
