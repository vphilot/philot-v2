<script setup lang="ts">
useHead({
  title: 'Vinícius Philot - Work',
  meta: [
    { name: 'description', content: 'Vinícius Philot is a Front-end UI developer' },
  ],
})
</script>

<template>
  <div class="w-full md:w-2/3 text-lg tracking-wide leading-relaxed">
    <section>
      <h1 class="text-4xl md:text-7xl tracking-wide mb-8 font-sans bg-clip-text text-transparent bg-gradient-to-r from-blue-500 to-green-600 dark:from-blue-500 dark:to-green-400">
        Currently: Senior Front-end Developer for
        <Link title="RBC" url="https://www.rbcroyalbank.com/" class="" :dashed="false">
          <!-- Safari hack -->
          <span class="bg-clip-text text-transparent bg-gradient-to-r from-blue-500 to-green-600 dark:from-blue-500 dark:to-green-400">
            RBC
          </span>
        </Link>
      </h1>
      <p class="mb-4">
        Currently working for RBC's Global Cyber Security team building enterprise web apps using Vue3, Vite, Tailwind, and a lot more cool tech but that's a longer conversation.
      </p>
    </section>
    <DividerY />

    <section>
      <div class="flex items-center space-x-4 mb-4">
        <h1 class="text-3xl md:text-4xl font-thin tracking-wide font-sans">
          Prev: Lead Front-end Developer for <Link title="Creative Layer" url="https://www.creativelayer.com/" class="" :dashed="false">
            <!-- Safari hack -->
            <span class="bg-clip-text text-transparent bg-gradient-to-r from-blue-500 to-green-600 dark:from-blue-500 dark:to-green-400">
              Creative Layer
            </span>
          </Link>
        </h1>
      </div>
      <ul class="pl-4 list-disc">
        <li> Joined CL in early 2021 as a remote engineer, working from Toronto with a diverse team of developers located all over Ontario. We built tools to empower creators by giving them access to new revenue streams</li>
        <li>Reported to the Director of Technology </li>
        <li>Bootstrapped web apps using Vue3, Vite, Tailwind, and a GraphQL layer backed by an AWS serverless stack </li>
        <li>Set up a 3d model parsing and rendering workflow with Blender, ThreeJS, and AWS Lambda to generate and export assets in the cloud</li>
        <li>Deep dived into the world of writing custom Shaders with GLSL which was both a huge headache and a fantastic journey at the same time</li>
        <li>Our first platform, <em>Workflow</em>, focused on the print-on-demand market by making it easy for merchants and artists to communicate, review, and ship their work.</li>
        <li>
          We then tapped into the Web3 space with <em> <Link title="Remx" url="https://remx.xyz/">
            Remx
          </Link></em>, a digital creative community focused on art, culture, & identity.
        </li>
      </ul>
    </section>
    <DividerY />
    <section>
      <div class="flex items-center space-x-4 mb-4">
        <h1 class="text-3xl md:text-4xl font-thin tracking-wide font-sans">
          Prev: Front-end Software Developer for <Link title="Cineplex Entertainment" url="https://www.cineplex.com/" class="" :dashed="false">
            <!-- Safari hack -->
            <span class="bg-clip-text text-transparent bg-gradient-to-r from-blue-500 to-green-600 dark:from-blue-500 dark:to-green-400">
              Cineplex Entertainment
            </span>
          </Link>
        </h1>
      </div>
      <ul class="pl-4 list-disc">
        <li>Worked with a team of developers and designers implementing a Front End modernization project from .NET MVC to Jamstack (Next.js and React)</li>
        <li>Delivered AODA / WCAG compliant solutions inside Cineplex, CineplexStore, and TheRecRoom</li>
        <li>Built web components using vanilla JavaScript, React, and Vue</li>
        <li>Transformed inline layouts into modularized templates, decoupling data and views using a headless CMS</li>
      </ul>
    </section>
    <DividerY />

    <section>
      <p>
        If we're going <em>vintage</em> <Link url="/docs/2023-viniciusphilot-resume.pdf" download>
          you can download my résume here
        </Link>
      </p>
    </section>
    <DividerY />
  </div>
</template>
