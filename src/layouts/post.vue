<template>
  <Container>
    <Navigation />
    <h1 class="text-4xl md:text-7xl tracking-wide bg-clip-text text-transparent bg-gradient-to-r from-blue-500 to-green-600 dark:from-blue-500 dark:to-green-400 break-words">
      {{ $route.name }}
    </h1>

    <DividerY />

    <router-view />
  </Container>
</template>
