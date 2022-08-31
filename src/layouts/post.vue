<template>
  <Container>
    <Navigation />
    <h1 class="text-4xl md:text-5xl font-extralight md:font-thin tracking-wide  bg-clip-text text-transparent bg-gradient-to-r from-blue-500 to-pink-500 dark:from-blue-500 dark:to-green-400 break-words md:leading-snug">
      {{ $route.name }}
    </h1>

    <DividerY />

    <router-view />
  </Container>
</template>
