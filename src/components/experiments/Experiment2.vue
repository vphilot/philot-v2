
<template>
  <div>
    <div id="renderer" />
  </div>
</template>

<script setup lang="ts">
import { Box3, Clock, Color, LineBasicMaterial, LineSegments, Mesh, PerspectiveCamera, PlaneGeometry, Scene, ShaderMaterial, SphereGeometry, Vector3, WebGLRenderer, WireframeGeometry } from 'three'
import { OrbitControls } from 'three/examples/jsm/controls/OrbitControls.js'

import { makeNoise4D } from 'open-simplex-noise'

import { setHelpers } from '../../../utils/utils'

const vertexShader = `
    #define NORMAL


    varying vec3 vViewPosition;
    varying vec3 vUv;

    #include <common>
    #include <uv_pars_vertex>
    #include <displacementmap_pars_vertex>
    #include <normal_pars_vertex>
    #include <morphtarget_pars_vertex>
    #include <skinning_pars_vertex>
    #include <logdepthbuf_pars_vertex>
    #include <clipping_planes_pars_vertex>

    void main() {

        #include <uv_vertex>

        #include <beginnormal_vertex>
        #include <morphnormal_vertex>
        #include <skinbase_vertex>
        #include <skinnormal_vertex>
        #include <defaultnormal_vertex>
        #include <normal_vertex>

        #include <begin_vertex>
        #include <morphtarget_vertex>
        #include <skinning_vertex>
        #include <displacementmap_vertex>
        #include <project_vertex>
        #include <logdepthbuf_vertex>
        #include <clipping_planes_vertex>

    #if defined( FLAT_SHADED ) || defined( USE_BUMPMAP ) || defined( TANGENTSPACE_NORMALMAP )
        vUv = position;

        vViewPosition = - mvPosition.xyz;

    #endif
    }
`

const fragmentShader = `
    uniform vec3 colorA;

    #define NORMAL

    varying vec3 vViewPosition;
    varying vec3 vUv;


    #include <packing>
    #include <uv_pars_fragment>
    #include <normal_pars_fragment>
    #include <bumpmap_pars_fragment>
    #include <normalmap_pars_fragment>
    #include <logdepthbuf_pars_fragment>
    #include <clipping_planes_pars_fragment>

    void main() {
        #include <clipping_planes_fragment>
        #include <logdepthbuf_fragment>
        #include <normal_fragment_begin>
        #include <normal_fragment_maps>

        gl_FragColor = vec4( normal * colorA + 0.5, 1.0 );
        gl_FragColor.a = 1.0;
    }
`

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
orbitControls.enablePan = false
// orbitControls.enableRotate = false
orbitControls.enableZoom = false

scene.background = new Color('#000')

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

const planeGeometry = new PlaneGeometry(100, 100, 100, 100)
const planeWireframe = new WireframeGeometry(planeGeometry)
const planeMaterial = new LineBasicMaterial({ color: 0xAAAAAA, linewidth: 1 })
const planeLines = new LineSegments(planeWireframe, planeMaterial)
planeWireframe.rotateX(-Math.PI / 2)

scene.add(planeLines)

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
  await refresh()
})

</script>
