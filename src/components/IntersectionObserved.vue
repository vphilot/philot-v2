<template>
  <div ref="target" :class="['transition-all transform-gpu duration-1000 motion-reduce:transition-none' , targetIsVisible ? 'opacity-100 translate-y-0' : 'motion-reduce:opacity-100 opacity-0 translate-y-10']">
    <slot />
  </div>
</template>

<script setup lang="ts">
const target = ref(null)
const targetIsVisible = ref(false)

const { stop } = useIntersectionObserver(
  target,
  ([{ isIntersecting }]) => {
    targetIsVisible.value = isIntersecting
    if (targetIsVisible.value)
      stop()
  }, { threshold: 0.5 },
)
</script>
