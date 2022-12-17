<script setup lang="ts">
import { Icon } from '@iconify/vue'
import { isDark, toggleDark } from '#/composables'

</script>

<template>
  <nav class="w-full mt-4 mb-8 md:mt-16 md:mb-16 flex justify-between">
    <div class="flex space-x-0">
      <router-link class="flex space-x-1 items-center text-xs px-4 py-2 rounded navLink" to="/" title="home" active-class="bg-dark text-light dark:bg-light dark:text-dark">
        <Icon icon="iconoir:home-user" width="64" class="w-8 h-8" />
        <span>index</span>
      </router-link>

      <router-link class="flex space-x-1 items-center text-xs px-4 py-2 rounded navLink" active-class="bg-dark text-light dark:bg-light dark:text-dark" to="/posts" title="posts">
        <Icon icon="fluent:notepad-20-regular" width="64" class="w-8 h-8" />
        <span>posts</span>
      </router-link>

      <router-link class="flex space-x-1 items-center text-xs px-4 py-2 rounded navLink" active-class="bg-dark text-light dark:bg-light dark:text-dark" to="/work" title="work">
        <Icon icon="fluent:code-20-regular" width="64" class="w-8 h-8" />
        <span>work</span>
      </router-link>

      <router-link class="flex space-x-1 items-center text-xs px-4 py-2 rounded navLink" active-class="bg-dark text-light dark:bg-light dark:text-dark" to="/experiments" title="lab">
        <Icon
          icon="fluent:beaker-20-regular" width="64" class="w-8 h-8"
        />
        <span>lab</span>
      </router-link>
    </div>

    <button title="toggle dark mode" @click="toggleDark()">
      <Icon v-if="isDark" icon="fluent:weather-moon-20-regular" width="64" class="w-8 h-8" />
      <Icon v-else icon="fluent:weather-moon-off-20-regular" width="64" class="w-8 h-8" />
    </button>
  </nav>
</template>

<style scoped>
@media (max-width: 768px) {
  .navLink span {
    display: none;
  }

  .navLink[aria-current='page'] span {
    display: unset;
  }
}
</style>
