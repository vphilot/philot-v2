<script setup lang="ts">
const router = useRouter()
</script>

<template>
  <Container>
    <Navigation />
    <button btn text-sm m="3 t8" @click="router.back()">
      Go back
    </button>
  </Container>
</template>
