<template>
  <div>
    <div id="renderer" />
  </div>
</template>

<script setup lang="ts">
import { AmbientLight, Box3, BoxGeometry, BufferAttribute, Clock, Color, Mesh, MeshBasicMaterial, MeshStandardMaterial, PerspectiveCamera, PlaneBufferGeometry, PlaneGeometry, RawShaderMaterial, Scene, SphereGeometry, SpotLight, Vector3, WebGLRenderer } from 'three'
import { OrbitControls } from 'three/examples/jsm/controls/OrbitControls.js'

// import vertexShader from './shaders/3/vertex.glsl'
// import fragmentShader from './shaders/3/fragment.glsl'

// scene
const scene = new Scene()

// renderer
const renderer = new WebGLRenderer({ antialias: true, alpha: false, preserveDrawingBuffer: true })
renderer.shadowMap.enabled = true
renderer.setSize(1024, 1024)

// camera
const camera = new PerspectiveCamera(50, 1, 0.1, 1000)
camera.position.set(2, 2, 2)
const orbitControls = new OrbitControls(camera, renderer.domElement)

const geometry = new PlaneBufferGeometry(1, 1, 32, 32)
// const material = new RawShaderMaterial({ vertexShader, fragmentShader })

// const mesh = new Mesh(geometry, material)

// scene.add(mesh)

const refresh = async() => {
  orbitControls.update()
  requestAnimationFrame(refresh)
  renderer.render(scene, camera)
}

onMounted(async() => {
  (document.querySelector('#renderer') as HTMLElement).appendChild(renderer.domElement)
  await refresh()
})
</script>
