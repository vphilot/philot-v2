<script setup lang="ts">
import { Icon } from '@iconify/vue'

import FrontEndIcon from '#/components/icons/FrontEndIcon.vue'
import VueIcon from '#/components/icons/VueIcon.vue'
import ReactIcon from '#/components/icons/ReactIcon.vue'
import TypescriptIcon from '#/components/icons/TypescriptIcon.vue'
import CSSIcon from '#/components/icons/CSSIcon.vue'
import HTMLIcon from '#/components/icons/HTMLIcon.vue'
import DividerY from '#/components/shared/DividerY.vue'

const Icons = [
  FrontEndIcon,
  VueIcon,
  ReactIcon,
  TypescriptIcon,
  CSSIcon,
  HTMLIcon,
]

const currentRoleIndex = ref(0)
const devRoles = ['Front-end', 'Vue', 'React', 'Typescript', 'CSS', 'HTML']
const spellingHelp = ref(false)

onMounted(() => {
  setInterval(() => {
    currentRoleIndex.value = (currentRoleIndex.value + 1) % devRoles.length
  }, 2000)
})

</script>

<template>
  <h1 class="text-5xl md:text-6xl lg:text-9xl font-thin">
    <span class="relative">
      <button class="absolute -right-10 rounded-full" aria-label="toggle spelling help" @click="spellingHelp = !spellingHelp">
        <Icon v-if="spellingHelp" icon="fluent:speaker-off-20-regular" width="64" class="w-8 h-8" />
        <Icon v-else icon="fluent:speaker-2-20-regular" width="64" class="w-8 h-8" />
      </button>
      <em v-if="spellingHelp" class="text-4xl md:text-6xl lg:text-9xl">Vee-nee-see-us</em>
      <span v-else>Vinícius</span>
    </span>
    <br>
    Philot
    <br>
    is a
    <br>
    <div class="inline-block w-full h-12 md:h-16 lg:h-32 relative overflow-hidden mt-2 lg:mt-6">
      <TransitionGroup
        enter-from-class="transform-gpu translate-y-full"
        enter-active-class="transition-all duration-500 delay-200 ease-in-out absolute"
        enter-to-class="transform-gpu translate-y-0"
        leave-from-class="transform-gpu translate-y-0"
        leave-active-class="transition-all duration-500 ease-out-in absolute"
        leave-to-class="transform-gpu -translate-y-full"
        mode="out-in"
        name="list"
      >
        <div
          v-for="role, index in devRoles"
          v-show="currentRoleIndex === index"
          :key="index"
          class="flex space-x-4 items-center"
        >
          <component :is="Icons[index]" class="w-12 h-12 lg:w-24 lg:h-24 stroke-blue-500 stroke-15" />
          <span class="bg-clip-text text-transparent bg-gradient-to-r from-blue-500 to-pink-500 dark:from-blue-500 dark:to-green-400">{{ role }}</span>
        </div>
      </TransitionGroup>
    </div>
    <br>
    developer
  </h1>

  <DividerY border />

  <div class="grid grid-cols-1 md:grid-cols-2 gap-x-8 w-full md:w-2/3 font-sans font-extralight text-lg tracking-wide leading-relaxed">
    <section class="md:col-span-2">
      <h2 class="font-sans font-extralight md:font-thin text-3xl mb-8 lg:text-5xl leading-tight">
        (sup! 👋)
      </h2>
      <p class="mb-8">
        I build Web applications for a living and I thrive in environments that encourage collaboration and ego-free dynamics. I believe in accessibility and inclusivity as core values for us to work towards a better Web.
      </p>

      <div class="grid md:grid-cols-6 gap-4 md:gap-8 mb-8 items-center">
        <p class="col-span-5 items-center">
          Currently Intermediate Front-end developer at <Link title="Creative Layer" url="https://www.creativelayer.com/">
            Creative Layer
          </Link>
        </p>
        <LinkRoute to="work" title="work">
          See all work
        </LinkRoute>
      </div>

      <div class="grid md:grid-cols-6 gap-4 md:gap-8 mb-8 items-center">
        <p class="col-span-5">
          Sometimes I like to write about my progress and experiences
        </p>
        <LinkRoute to="posts" title="posts">
          See all posts
        </LinkRoute>
      </div>

      <div class="flex space-x-2">
        <a rel="noreferrer" href="https://github.com/vphilot" title="Github" target="_blank">
          <Icon icon="iconoir:github" width="64" class="w-8 h-8 text-blue-500" />
        </a>
        <a rel="noreferrer" href="https://www.linkedin.com/in/vphilot/?locale=en_US" title="Linkedin" target="_blank">
          <Icon icon="iconoir:linkedin" width="64" class="w-8 h-8 text-blue-500" />
        </a>
        <a rel="noreferrer" href="https://twitter.com/vphilot" title="Twitter" target="_blank">
          <Icon icon="iconoir:twitter" width="64" class="w-8 h-8 text-blue-500" />
        </a>
      </div>
      <DividerY />
    </section>

    <section>
      <h2 class="font-sans font-extralight md:font-thin text-3xl mb-4 lg:text-5xl leading-tight">
        Motto
      </h2>
      <p>
        <ul class="pl-4 list-disc">
          <li>
            All work, no BS
          </li>
          <li>
            We're kind
          </li>
          <li>
            We value each other's time
          </li>
          <li>
            We're proud of what we do
          </li>
          <li>
            <Link title="Ruined by Design" url="https://www.ruinedby.design/">
              Ruined by Design
            </Link>
          </li>
        </ul>
      </p>
      <DividerY />
    </section>

    <section class="">
      <h2 class="font-sans font-extralight md:font-thin text-3xl mb-4 lg:text-5xl leading-tight">
        Stack
      </h2>
      <p>
        <ul class="pl-4 list-disc">
          <li>
            Typescript
          </li>
          <li>
            Javascript (vanilla)
          </li>
          <li>
            Vue
          </li>
          <li>
            React
          </li>
          <li>
            Tailwind
          </li>
          <li>
            Jest
          </li>
        </ul>
      </p>
      <DividerY />
    </section>

    <section class="md:col-span-2">
      <h2 class="font-sans font-extralight md:font-thin text-3xl mb-4 lg:text-5xl leading-tight">
        Background
      </h2>
      <p>
        I started building websites for friends and family with Flash when I was 17 yo as a self-taught ActionScript2 developer. I kept flirting with Web technologies as a hobby over the years while exploring other career perspectives until I decided it was time to pursue doing what I love full time.
      </p>
      <DividerY />
    </section>

    <section class="md:col-span-2">
      <h2 class="font-sans font-extralight md:font-thin text-3xl mb-4 lg:text-5xl leading-tight">
        Apps & gear
      </h2>
      <ul class="pl-4 list-disc">
        <li>
          I use VSCode for most dev-related tasks. I've used Atom before, tried WebStorm, but I think VSCode is just way faster and easier to customize
        </li>
        <li>
          My preferred combo is
          <Link title="Dracula theme for VSCode" url="https://draculatheme.com/visual-studio-code">
            Dracula theme
          </Link> +
          <Link title="JetBrains Mono font" url="https://www.jetbrains.com/lp/mono/">
            JetBrains Mono font
          </Link>
        </li>
        <li>
          <Link title="iTerm2" url="https://iterm2.com/">
            iTerm2
          </Link>
          with
          <Link title="Oh My Zsh" url="https://github.com/ohmyzsh/ohmyzsh">
            Oh My Zsh
          </Link>
          +
          <Link title="powerlevel10k Zsh theme" url="https://github.com/romkatv/powerlevel10k">
            powerlevel10k
          </Link>
        </li>
        <li>
          I'm a huge fan of aliases and
          <Link title="list of terminal aliases and how-to" url="https://gist.github.com/irazasyed/5987629">
            this list
          </Link>
          is a good starting point
        </li>
        <li>
          I have no preferred browser <em>(unpopular opinion alert)</em> but I like Safari for convenience and Chrome for development
        </li>
        <li>
          I use a Macbook Pro 15 (2019) and my favourite MacOS productiviy tools are
          <Link title="CopyClip" url="https://apps.apple.com/us/app/copyclip-clipboard-history/id595191960?mt=12">
            CopyClip
          </Link>,
          <Link title="Magnet" url="https://magnet.crowdcafe.com/">
            Magnet
          </Link>,
          <Link title="ColorSlurp" url="https://colorslurp.com/">
            ColorSlurp
          </Link>,
          <Link title="Amphetamine" url="https://apps.apple.com/us/app/amphetamine/id937984704?mt=12">
            Amphetamine
          </Link>,  and
          <Link title="Raycast" url="https://www.raycast.com/">
            Raycast
          </Link>
        </li>
        <li>
          I love the convenience of having a full USB-C hub display and I'm pretty satisfied with my
          <Link title="Dell P2721Q display" url="https://www.dell.com/en-sg/shop/dell-27-4k-usb-c-monitor-p2721q/apd/210-axtl/monitors-monitor-accessories">
            Dell P2721Q
          </Link> &nbsp; since late 2020
        </li>
      </ul>
      <DividerY />
    </section>

    <section class="md:col-span-2">
      <h2 class="font-sans font-extralight md:font-thin text-3xl mb-4 lg:text-5xl leading-tight">
        Little known facts
      </h2>
      <ul class="pl-4 list-disc leading-relaxed">
        <li>
          Brazilian Canadian, born in a
          <Link title="São Pedro da Serra" url="https://www.google.com/maps/place/S%C3%A3o+Pedro+da+Serra,+Nova+Friburgo+-+State+of+Rio+de+Janeiro,+Brazil/@-22.3172021,-42.3430275,15z/data=!3m1!4b1!4m5!3m4!1s0x97ecc6bc6c0657:0x7625000c6484f178!8m2!3d-22.3172226!4d-42.3342727?shorturl=1">
            tiny little town
          </Link>
          in the Atlantic forest, grandson of farmers, and proud of every single tiny victory I've accomplished.
        </li>
        <li>
          I was an Architect before working with Web Development full time. I carry a lot of analytical thinking and design strategy/planning from the great experiences I had back then. Just took me many years of education and work experience to realize I really liked computers after all.
        </li>
        <li>
          I'm into biking, skating, gaming, and painting.
        </li>
      </ul>
      <DividerY />
    </section>

    <section class="md:col-span-2">
      <p class="text-sm leading-loose text-gray-500 dark:text-gray-400">
        This website is powered by
        <Link title="Vue3" url="https://vuejs.org/">
          Vue3
        </Link>,
        <Link title="Vite" url="https://vitejs.dev/">
          Vite
        </Link>,
        <Link title="Vite-SSG" url="https://github.com/antfu/vite-ssg">
          Vite-SSG
        </Link>,
        <Link title="Typescript" url="https://www.typescriptlang.org/">
          Typescript
        </Link>, and
        <Link title="Vitesse" url="https://tailwindcss.com/">
          Tailwind
        </Link>,
        built with a fork I made of the amazing
        <Link title="Vitesse" url="https://github.com/antfu/vitesse">
          Vitesse Template
        </Link> by
        <Link title="Anthony Fu" url="https://github.com/antfu">
          @Anthony Fu
        </Link>.
      </p>
      <DividerY />
    </section>
  </div>
</template>

<route lang="yaml">
meta:
  layout: home
</route>
