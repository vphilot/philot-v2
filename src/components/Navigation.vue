<script setup lang="ts">
import { Icon } from '@iconify/vue'
import { isDark, toggleDark } from '#/composables'

</script>

<template>
  <nav class="w-full mt-4 mb-8 md:mt-16 md:mb-16 flex justify-between">
    <div class="flex space-x-2">
      <router-link class="" to="/" title="home">
        <Icon icon="iconoir:home-user" width="64" class="w-8 h-8" />
      </router-link>

      <router-link class="" to="/posts" title="posts">
        <Icon icon="fluent:notepad-20-regular" width="64" class="w-8 h-8" />
      </router-link>

      <router-link class="" to="/work" title="work">
        <Icon icon="fluent:code-20-regular" width="64" class="w-8 h-8" />
      </router-link>
    </div>

    <button title="toggle dark mode" @click="toggleDark()">
      <Icon v-if="isDark" icon="fluent:weather-moon-20-regular" width="64" class="w-8 h-8" />
      <Icon v-else icon="fluent:weather-moon-off-20-regular" width="64" class="w-8 h-8" />
    </button>
  </nav>
</template>
