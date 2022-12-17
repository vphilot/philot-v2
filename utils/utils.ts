import type { Object3D, Scene } from 'three'
import { AxesHelper, BoxHelper, Color, GridHelper, Group, Mesh, PointLight, PointLightHelper, SpotLight, SpotLightHelper } from 'three'

export const setHelpers = (scene: Scene) => {
  scene.add(new AxesHelper(10))
  scene.add(new GridHelper(20, 20))

  scene.traverse((child: Object3D) => {
    const color = new Color().setHSL(Math.random(), 1, 0.5)

    switch (child.constructor) {
      case SpotLight:
        scene.add(new SpotLightHelper(child as SpotLight, `#${color.getHexString()}`))
        break

      case PointLight:
        scene.add(new PointLightHelper(child as PointLight, 0.1, `#${color.getHexString()}`))
        break

      case Group:
        scene.add(new BoxHelper(child, `#${color.getHexString()}`))
        break

      case Mesh:
        if (child.name === 'ground')
          scene.add(new BoxHelper((child as Mesh), `#${color.getHexString()}`))

        break

      default:
        break
    }
  })
}
