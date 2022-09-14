
<template>
  <div>
    <div id="renderer" />
  </div>
</template>

<script setup lang="ts">
import { AmbientLight, Box3, BoxGeometry, BufferAttribute, Color, Mesh, MeshStandardMaterial, PerspectiveCamera, PlaneGeometry, Scene, ShaderMaterial, SpotLight, Vector3, WebGLRenderer } from 'three'
import { OrbitControls } from 'three/examples/jsm/controls/OrbitControls.js'

import { setHelpers } from '../../../utils/utils'

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
// orbitControls.enablePan = false
// orbitControls.enableRotate = false
// orbitControls.enableZoom = false

// lights
const ambientLight = new AmbientLight(0xFFFFFF, 0.5)
const spotLight1 = new SpotLight(0xFFFFFF, 0.5)
spotLight1.castShadow = true
spotLight1.position.set(2, 2, 2)

scene.add(ambientLight)
scene.add(spotLight1)

scene.background = new Color('#ddd')

// geometry
const boxGeometry = new BoxGeometry(1, 1, 1, 20, 20, 20)

// shader
const uniforms = {
  delta: { value: 0 },
}

const vertexDisplacement = new Float32Array(boxGeometry.attributes.position.count)

for (let i = 0; i < vertexDisplacement.length; i++)
  vertexDisplacement[i] = Math.sin(i)

boxGeometry.setAttribute('vertexDisplacement', new BufferAttribute(vertexDisplacement, 1))

const vertexShader = `
attribute float vertexDisplacement;
uniform float delta;
varying float vOpacity;
varying vec3 vUv;

void main() {
  vUv = position;
  vOpacity = vertexDisplacement;
  vec3 p = position;

  p.x += sin(vertexDisplacement * delta);
  p.y += cos(vertexDisplacement * 0.1);
  p.z += atan(vertexDisplacement * 0.1);

  vec4 modelViewPosition = modelViewMatrix * vec4(p, 1.0);
  gl_Position = projectionMatrix * modelViewPosition;
}
`

const fragmentShader = `
uniform float delta;
varying float vOpacity;
varying vec3 vUv;

void main() {
  float r = 1.0 * cos(vUv.x * delta);
  float g = 1.0 * sin(delta) * 0.5;
  float b = 1.0 * cos(vUv.x * delta);

  gl_FragColor = vec4(r, g, b, 1.0);
}
`

const boxMaterial = new ShaderMaterial({
  uniforms,
  fragmentShader,
  vertexShader,
})

// const boxMaterial = new MeshStandardMaterial({ color: new Color('#eee') })
const boxMesh = new Mesh(boxGeometry, boxMaterial)
boxMesh.receiveShadow = true
boxMesh.castShadow = true
const bBox = new Box3().setFromObject(boxMesh)
const boxDimensions = new Vector3()
bBox.getSize(boxDimensions)
boxMesh.position.set(0, boxDimensions.y / 2, 0)
scene.add(boxMesh)

const planeGeometry = new PlaneGeometry(10, 10, 10, 10)
const planeMaterial = new MeshStandardMaterial()
const planeMesh = new Mesh(planeGeometry, planeMaterial)
planeMesh.rotateX(-Math.PI / 2)
planeMesh.receiveShadow = true
planeMesh.castShadow = false

scene.add(planeMesh)

const refresh = async() => {
  // shader
  boxMesh.material.uniforms.delta.value += 0.1
  // rest
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
