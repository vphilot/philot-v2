<template>
  <Container>
    <Navigation />
    <h1 class="text-4xl md:text-5xl font-extralight md:font-thin tracking-wide border-b border-b-gray-500 mb-8 pb-8 bg-clip-text text-transparent bg-gradient-to-r from-blue-500 to-pink-500 dark:from-blue-500 dark:to-green-400 break-words md:leading-snug">
      {{ $route.name }}
    </h1>
    <router-view />
  </Container>
</template>
