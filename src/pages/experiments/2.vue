
<template>
  <div>
    <div id="renderer" />
  </div>
</template>

<script setup lang="ts">
import { AmbientLight, Box3, Clock, Color, Mesh, MeshStandardMaterial, PerspectiveCamera, PlaneGeometry, Scene, ShaderMaterial, SphereGeometry, SpotLight, Vector3, WebGLRenderer } from 'three'
import { OrbitControls } from 'three/examples/jsm/controls/OrbitControls.js'

import { makeNoise4D } from 'open-simplex-noise'

import { setHelpers } from '../../../utils/utils'
import { fragmentShader, vertexShader } from './2'

// scene
const scene = new Scene()

// renderer
const renderer = new WebGLRenderer({ antialias: true, alpha: false, preserveDrawingBuffer: true })
renderer.shadowMap.enabled = true
renderer.setSize(1024, 1024)

// camera
const camera = new PerspectiveCamera(50, 1, 0.1, 1000)
camera.position.set(4.6, 5.5, 4.5)
const orbitControls = new OrbitControls(camera, renderer.domElement)
// orbitControls.enablePan = false
// orbitControls.enableRotate = false
// orbitControls.enableZoom = false

// lights
const ambientLight = new AmbientLight(0xFFFFFF, 0.5)
const spotLight1 = new SpotLight(0xFFFFFF, 0.5)
spotLight1.castShadow = true
spotLight1.position.set(2, 10, 2)

scene.add(ambientLight)
scene.add(spotLight1)

scene.background = new Color('#ddd')

// geometry
const sphereGeometry = new SphereGeometry(1.5, 100, 100)
const positionData: Vector3[] = []
const v3 = new Vector3()

for (let i = 0; i < sphereGeometry.attributes.position.count; i++) {
  v3.fromBufferAttribute(sphereGeometry.attributes.position, i)
  positionData.push(v3.clone())
}

const sphereMaterial = new ShaderMaterial({
  uniforms: {
    colorA: { value: new Vector3(0.5, 0.5, 0.5) },
  },
  vertexShader,
  fragmentShader,
})

const vertexDisplacement = new Float32Array(sphereGeometry.attributes.position.count)

for (let i = 0; i < vertexDisplacement.length; i++)
  vertexDisplacement[i] = Math.sin(i)

const sphereMesh = new Mesh(sphereGeometry, sphereMaterial)
sphereMesh.receiveShadow = true
sphereMesh.castShadow = true
const bBox = new Box3().setFromObject(sphereMesh)
const boxDimensions = new Vector3()
bBox.getSize(boxDimensions)
sphereMesh.position.set(0, boxDimensions.y + 0.2 / 2, 0)
scene.add(sphereMesh)
camera.lookAt(sphereMesh.position)
orbitControls.target = sphereMesh.position

const planeGeometry = new PlaneGeometry(100, 100, 100, 10)
const planeMaterial = new MeshStandardMaterial()
const planeMesh = new Mesh(planeGeometry, planeMaterial)
planeMesh.rotateX(-Math.PI / 2)
planeMesh.receiveShadow = true
planeMesh.castShadow = false

scene.add(planeMesh)

const noise = makeNoise4D(Date.now())
const clock = new Clock()

renderer.setAnimationLoop(() => {
  const t = clock.getElapsedTime() / 1.0
  positionData.forEach((p, idx) => {
    const setNoise = noise(p.x, p.y, p.z, t / 2)
    v3.copy(p).addScaledVector(p, setNoise)
    sphereGeometry.attributes.position.setXYZ(idx, v3.x, v3.y, v3.z)
  })

  sphereGeometry.computeVertexNormals()
  sphereGeometry.attributes.position.needsUpdate = true
})

const refresh = async() => {
  // const t = clock.getElapsedTime() / 1.0
  // const a = Math.random()
  // const setNoise = noise(Math.random(), Math.random(), Math.random(), t * 1.05)

  // sphereMesh.material.uniforms.colorA.value.addScaledVector(new Vector3(a, a, a), setNoise)

  orbitControls.update()
  requestAnimationFrame(refresh)
  renderer.render(scene, camera)
}

onMounted(async() => {
  (document.querySelector('#renderer') as HTMLElement).appendChild(renderer.domElement)
  setHelpers(scene)
  // direct camera
  await refresh()
})

</script>
