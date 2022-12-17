<template>
  <div class="relative">
    <div id="gui" class="absolute top-0 left-0" />
    <div id="renderer" />
    <p class="mt-2 text-xs">
      texture credits: <a class="underline" href="https://unsplash.com/photos/aMPfitH2tT0" target="_blank">
        Pawel Czerwinski</a>
    </p>
  </div>
</template>

<script setup lang="ts">
import { Clock, DoubleSide, Mesh, PerspectiveCamera, PlaneBufferGeometry, RawShaderMaterial, Scene, TextureLoader, Vector2, WebGLRenderer } from 'three'
import { OrbitControls } from 'three/examples/jsm/controls/OrbitControls.js'

import vertexShader from './shaders/5/vertex.glsl'
import fragmentShader from './shaders/5/fragment.glsl'

// clock
const clock = new Clock()

// scene
const scene = new Scene()

// renderer
const renderer = new WebGLRenderer({ antialias: true, alpha: false, preserveDrawingBuffer: true })
renderer.shadowMap.enabled = true
renderer.setSize(1024, 1024)

// camera
const camera = new PerspectiveCamera(50, 1, 0.1, 1000)
camera.position.set(1, 1, 1)
const orbitControls = new OrbitControls(camera, renderer.domElement)

// geo
const geometry = new PlaneBufferGeometry(1, 1, 128, 128)

// texture
const textureLoader = new TextureLoader()
const texture = textureLoader.load('../images/textures/texture-1.jpg')

// material
const material = new RawShaderMaterial({
  vertexShader,
  fragmentShader,
  transparent: true,
  side: DoubleSide,
  uniforms: {
    uFrequency: {
      value: new Vector2(5, 5),
    },
    uTime: {
      value: 0,
    },
    uTexture: {
      value: texture,
    },
  },
})

const mesh = new Mesh(geometry, material)

scene.add(mesh)

const refresh = async() => {
  orbitControls.update()
  requestAnimationFrame(refresh)
  material.uniforms.uTime.value = clock.getElapsedTime()
  renderer.render(scene, camera)
}

onMounted(async() => {
  (document.querySelector('#renderer') as HTMLElement).appendChild(renderer.domElement)
  // gui
  const dat = await import('dat.gui')
  const gui = new dat.GUI({ autoPlace: false })
  gui.domElement.id = 'gui'
  document.getElementById('gui')?.appendChild(gui.domElement)
  gui.add(material.uniforms.uFrequency.value, 'x').min(0).max(20).step(0.01).name('freqX')
  gui.add(material.uniforms.uFrequency.value, 'y').min(0).max(20).step(0.01).name('freqY')

  await refresh()
})
</script>
