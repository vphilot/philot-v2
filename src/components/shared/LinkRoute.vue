<script setup lang="ts">
import { Icon } from '@iconify/vue'

defineProps<{
  to: string
  title: string
}>()
</script>
<template>
  <div>
    <router-link
      class="routeLink font-sans font-normal w-52 py-2 bg-light dark:bg-dark rounded-full relative inline-flex space-x-2 items-center justify-center"
      :to="to"
      :title="title"
    >
      <Icon
        icon="fluent:arrow-step-over-16-filled" width="64" class="w-6 h-6 text-blue-500 dark:text-green-500"
      />
      <span>
        <slot />
      </span>
    </router-link>
  </div>
</template>

<style scoped>
.routeLink::before {
  content: "";
  position: absolute;
  top: calc(-1 * theme('width.px'));
  left: calc(-1 * theme('width.px'));
  width: calc(100% + (theme('width.px') * 2));
  height: calc(100% + (theme('width.px') * 2));
  z-index: -1;
  border-radius: theme('borderRadius.full');
  background: linear-gradient(90deg, theme('colors.blue.500'), theme('colors.pink.500'));
}
.dark .routeLink::before {
  background: linear-gradient(90deg, theme('colors.blue.500'), theme('colors.green.500'));
}
</style>
