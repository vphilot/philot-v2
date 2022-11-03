<template>
  <div class="relative">
    <div id="gui" class="absolute top-0 left-0" />
    <div id="renderer" />
  </div>
</template>

<script setup lang="ts">
import { BufferAttribute, Clock, DoubleSide, Mesh, PerspectiveCamera, PlaneBufferGeometry, RawShaderMaterial, Scene, Vector2, WebGLRenderer } from 'three'
import { OrbitControls } from 'three/examples/jsm/controls/OrbitControls.js'
import { GUI } from 'dat.gui'

import vertexShader from './shaders/4/vertex.glsl'
import fragmentShader from './shaders/4/fragment.glsl'

const gui = new GUI({ autoPlace: false })

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

const count = geometry.attributes.position.count
const randoms = new Float32Array(count).map((val) => {
  return Math.random()
})

geometry.setAttribute('aRandom', new BufferAttribute(randoms, 1))

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
  },
})

gui.add(material.uniforms.uFrequency.value, 'x').min(0).max(20).step(0.01).name('freqX')
gui.add(material.uniforms.uFrequency.value, 'y').min(0).max(20).step(0.01).name('freqY')

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
  gui.domElement.id = 'gui'
  document.getElementById('gui')?.appendChild(gui.domElement)
  await refresh()
})
</script>
