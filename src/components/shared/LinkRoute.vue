<script setup lang="ts">
import { Icon } from '@iconify/vue'

defineProps<{
  to: string
  title: string
}>()
</script>
<template>
  <div class="">
    <router-link
      class="border border-dark dark:border-light font-sans font-normal w-52 py-2 bg-light dark:bg-dark rounded-full relative inline-flex space-x-2 items-center justify-center"
      :to="to"
      :title="title"
    >
      <Icon
        icon="fluent:arrow-step-over-16-filled" width="64" class="w-6 h-6 text-dark dark:text-light"
      />
      <span>
        <slot />
      </span>
    </router-link>
  </div>
</template>
