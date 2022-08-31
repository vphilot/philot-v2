<template>
  <div
    :class="['w-full mb-12 lg:mb-20', border && 'pb-12 lg:pb-20 border-b border-b-gray-500']"
  />
</template>

<script setup lang="ts">
defineProps({
  border: {
    type: Boolean,
    default: false,
  },
})
</script>
